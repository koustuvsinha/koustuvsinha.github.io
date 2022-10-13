---
title: "Replicating Zotero-connector functionality in Emacs … without Zotero!"
date: 2022-10-12T18:26:00-04:00
draft: false
commentable: true
---

In my [last blog post](/post/emacs_research_workflow/) I described a method I use to keep track of my paper reading habits, using Emacs. Using the workflow, I can now:

-   Check the latest Arxiv papers using [Elfeed](https://github.com/skeeto/elfeed)
-   Score the papers using [Elfeed-Score](https://github.com/sp1ff/elfeed-score)
-   Save the papers in a local bib file, along with pdfs, using [org-ref](https://github.com/jkitchin/org-ref) functions
-   Maintain a paper reading tracker document in [Org Mode](https://orgmode.org/), where the workflow automatically adds the paper to read.

One crucial step I later realised which is missing from this workflow is the ability to store papers from my browser. Typically I do not read Elfeed _that_ religiously - my main source of papers always has been recommendations from colleagues, Twitter, conference acceptance lists etc. Thus, I need a setup where I can easily save an interesting paper I'm reading directly from the browser.

[Zotero](https://www.zotero.org/) is a great bibliography management software which allows you to do exactly that. After you install Zotero, you can install Zotero-connectors for the browser you use, and once you are in any PDF/journal/conference paper page, if you click the connector it automatically saves the file in your library, and downloads the pdf accordingly. With some extra plugins (Better Bibtex, Zutilo) you can also configure your setup such that once Zotero saves the PDF, it renames the file to proper naming conventions and moves the file to your desired location. Oh, also Zotero can be configured to automatically export a bibfile of your entire library, which you can load into Emacs using your favorite bibfile search library ([Helm-bibtex](https://rgoswami.me/posts/org-note-workflow/), [Citar](https://emacsconf.org/2021/talks/research/), [Zotxt](https://irreal.org/blog/?p=5771) etc)!

However, I have one major gripe in this workflow : this doesn't allow me to update my paper reading org file once Zotero saves the pdf! I thought about various ways to fix this, including writing a Python file to add a watcher on my bibfile, get the latest changed bib, add a line in my org file. The problem with this approach is that Zotero updates the bibfile after formatting and sorting, so to get the last updated bib entry I need to maintain a state of history of the file. Furthermore, for _any_ edits in the Zotero database, this watcher would run and add multiple lines of "Read paper X" in my paper reading list. There could be other easy ways to do this using Zotero, but I was out of ideas.

Plus, this post is not about Zotero, its about doing the same functionality in Emacs using existing libraries. How do we build a connector from browser? Also, I mostly read Arxiv papers anyway, so I would not need the power of 600+ Zotero translators written for various research paper sources, just the one for Arxiv. Enter [org-protocol](https://orgmode.org/worg/org-contrib/org-protocol.html).

Org-Protocol is this wonderful library which allows Emacs to intercept calls from emacsclient. I got my initial motivation to use org-protocol from this cool package: [Zotra](https://github.com/mpedramfar/zotra). What Zotra does is it runs the Zotero standalone [translation server](https://github.com/zotero/translation-server/), where the client can send an URL of a page containing a paper/PDF and get the formatted bibtex entry as output. One caveat of Zotra is that you need to run this external program via Docker on your machine, as running the standalone with `npm` [rarely works](https://github.com/zotero/translation-server/issues/139). Another caveat is that this translation server will return the bibtex entry _without_ the PDF or link to PDF file in local, which is crucial for me to read the paper offline and through Helm-bibtex (checkout my last blog post). Having said that, Zotra gave me the idea to use org-protocol in the first place, for which I'm glad I stumbled into it!

Configuring Org-Protocol is easy. First, you need to let org-protocol know what to run when it _encounters_ a protocol. For that, you need to add an entry to the `org-protocol-protocol-alist` :

```elisp
(add-to-list 'org-protocol-protocol-alist
             '("arxiv-protocol"
               :protocol "arxiv"
               :function arxiv-protocol))
```

How does org-protocol gets triggered in the first place? Open your browser and add the following bookmark (also known as bookmarklet), and name it as "Save PDF":

```html
javascript:location.href=('org-protocol://arxiv?url=%27+%20encodeURIComponent(location.href)).replace(/%27/gi,%22%27%22)
```

If you click this bookmark link on any page, then it would popup a message : "Open in Emacs?". What it does behind the scenes is that it runs a systemwide call in the `org-protocol` protocol, which is intercepted by emacsclient. Then, we define a _sub-protocol_ named `arxiv`, which is used in the `location.href` bookmark, which uses a parameter `url`, where the current page url is encoded. Once you click OK to open the link in Emacs (set this to never ask you again in future), org-protocol now looks at the list `org-protocol-protocol-alist` to find whose `:protocol` matches the sub-protocol used in the call, and runs its corresponding `:function`.

Now, all we need to do is to define a function which:

1.  Inputs an Arxiv link (could be the PDF link or the Abstract link)
2.  Fetches the PDF and bibtex from Arxiv
3.  Stores the PDF into a predestined location, and adds the bibtex in my main bibfile
4.  Add a note about this paper to read in my paper tracker org file.

We are in luck! In my [last blog post](/post/emacs_research_workflow/), I wrote functions to do 2-4! Re-using the function again here:

```elisp
;; Save arxiv pdf to local and maintain a bibfile for the newly added paper, and update papers.org
(defun my/save-arxiv-to-local-db (matched-arxiv-number)
    "Save arxiv paper in local db

- Update the bib entry with the pdf file location
- Add a TODO entry in my papers.org to read the paper"
    (message "Going to arXiv: %s" matched-arxiv-number)
    (let* ((last-arxiv-key "")
           (last-arxiv-title ""))
        (arxiv-get-pdf-add-bibtex-entry matched-arxiv-number arxiv_bib arxiv_pdf_loc)
        ;; Now, we are updating the most recent bib file with the pdf location
        (message "Update bibtex with pdf file location")
        (save-window-excursion
                ;; Get the bib file
                (find-file arxiv_bib)
                ;; get to last line
                (goto-char (point-max))
                ;; get to the first line of bibtex
                (bibtex-beginning-of-entry)
                (let* ((entry (bibtex-parse-entry))
                        (key (cdr (assoc "=key=" entry)))
                        (title (bibtex-completion-apa-get-value "title" entry))
                        (pdf (org-ref-get-pdf-filename key)))
                        (message (concat "checking for key: " key))
                        (message (concat "value of pdf: " pdf))
                        (when (file-exists-p pdf)
                        (bibtex-set-field "file" pdf)
                        (setq last-arxiv-key key)
                        (setq last-arxiv-title title)
                        (save-buffer)
                        )))
        ;; (message (concat "outside of save window, key: " last-arxiv-key))
        ;; Add a TODO entry with the cite key and title
        ;; This is a bit hacky solution as I don't know how to add the org entry programmatically
        (save-window-excursion
          (find-file (concat org-directory "papers.org"))
          (goto-char (point-max))
          (insert (format "** TODO Read paper (cite:%s) %s" last-arxiv-key last-arxiv-title))
          (save-buffer)
          ))
  )
```

All this function needs is the arxiv number of a given paper, which is typically in the format of `xxxx.xxxxx`. Then, using the mighty [org-ref](https://github.com/jkitchin/org-ref), this function fetches the pdf from Arxiv, gets a bibtex entry, writes the entry in my local bibfile, and adds a "TODO Read paper" entry in my paper tracker.

Thus, I need to extract this arxiv number from a given URL. I now define the `arxiv-protocol` function which org-protocol expects to trigger:

```elisp
(defun arxiv-protocol (info)
  (let ((url (plist-get info :url)))
    (message (format "Arxiv received: `%s'" url))
    (let* ((match-idx (string-match "arxiv.org/.../\\([0-9.]*\\)" url))
        (matched-arxiv-number (string-remove-suffix "." (match-string 1 url))))
        (message (format "Extracted Arxiv number: `%s'" matched-arxiv-number))
        (when matched-arxiv-number
          (my/save-arxiv-to-local-db matched-arxiv-number)))
    nil))
```

This function does the following:

-   From a given Arxiv URL (either abstract or PDF) perform a string match to extract the number
-   For PDF links, this string match returns a number containing a trailing "`.`" (as our regexp expects `.` as well as numbers). Use `string-remote-suffix` to get rid of this trailing character.
-   Call the function to extract and save the pdf!

{{< figure src="/ox-hugo/org_protocol_arxiv_demo.gif" >}}

Thats it, you have now replicated Zotero connector functionality _without_ needing to have Zotero installed! It only works on Arxiv at the moment, but it is okay for now for me. In the future I'll investigate ways to get the entire Zotero translator functionalities directly in Emacs.

Thanks for reading!
