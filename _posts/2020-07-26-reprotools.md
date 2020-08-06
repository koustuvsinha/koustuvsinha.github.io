---
layout: post
title: ML Reproducibility Tools and Best Practices
date: 2020-08-05 10:00:00
description: Best practices and tools to promote reproducible ML research
permalink: /practices_for_reproducibility/
comments: true
---

_[Koustuv Sinha](https://www.cs.mcgill.ca/~ksinha4) and [Jessica Zosa Forde](https://scholar.google.com/citations?user=1k12VDMAAAAJ&hl=en)_

A recurrent challenge in machine learning research is to ensure that the presented and published results are reliable, robust, and reproducible [[4](http://proceedings.mlr.press/v97/bouthillier19a.html),[5](https://arxiv.org/abs/1711.10337),[6](https://arxiv.org/abs/1709.06560),[7](https://arxiv.org/abs/1909.06674)].

Reproducibility, obtaining similar results as presented in a paper using the same code and data, is necessary to verify the reliability of research findings. Reproducibility is also an important step to promote open and accessible research, thereby allowing the scientific community to quickly integrate new findings and convert ideas to practice. Reproducibility also promotes the use of robust experimental workflows, which potentially reduce unintentional errors.

In this blog post, we will share commonly used tools and explain 12 basic practices that you can use in your research to ensure reproducible science.

## Tools

**Updated** : 5th August, 2020

|     | Practice                | Tools                                                                                                                                                                                                                                                          |
| --- | ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | Config Management       | [Hydra](https://hydra.cc), [OmegaConf](https://github.com/omry/omegaconf), [Pytorch Lightning](https://github.com/PyTorchLightning/pytorch-lightning)                                                                                                          |
| 2   | Checkpoint Management   | [Pytorch Lightning](https://github.com/PyTorchLightning/pytorch-lightning), [TestTube](https://github.com/williamFalcon/test-tube)                                                                                                                             |
| 3   | Logging                 | [Tensorboard](https://www.tensorflow.org/tensorboard), [Comet.ML](https://www.comet.ml/site/), [Weights & Biases](https://www.wandb.com/), [MLFlow](https://mlflow.org/), [Visdom](https://github.com/facebookresearch/visdom), [Neptune](https://neptune.ai/) |
| 4   | Seed                    | _Check best practices below_                                                                                                                                                                                                                                   |
| -   | Experiment Management   | [Pytorch Lightning](https://github.com/PyTorchLightning/pytorch-lightning), [MLFlow](https://mlflow.org/)                                                                                                                                                      |
| 5   | Versioning              | [Github](https://github.com), [Gitlab](https://gitlab.com)                                                                                                                                                                                                     |
| 6   | Data Management         | [DVC](https://dvc.org), [CML](https://cml.dev)                                                                                                                                                                                                                 |
| 7   | Data analysis           | [Jupyter Notebook](https://jupyter.org/), [papermill](https://papermill.readthedocs.io/en/latest/), [JupyterLab](https://jupyterlab.readthedocs.io/en/stable/), [Google Colab](https://colab.research.google.com/)                                             |
| 8   | Reporting               | [Matplotlib](https://matplotlib.org/), [Seaborn](https://seaborn.pydata.org/) , [Pandas](https://pandas.pydata.org/), [Overleaf](https://www.overleaf.com/)                                                                                                    |
| 9   | Dependency Management   | [pip](https://pypi.org/project/pip/), [conda](https://docs.conda.io/en/latest/), [Poetry](https://python-poetry.org/), [Docker](https://www.docker.com/), [Singularity](https://sylabs.io/docs/), [repo2docker](https://github.com/jupyter/repo2docker)        |
| 10  | Open Source Release     | [Squash Commits](https://stackoverflow.com/questions/5189560/squash-my-last-x-commits-together-using-git), [Binder](https://mybinder.org/)                                                                                                                     |
| 11  | Effective Communication | [ML Code Completeness Checklist](https://medium.com/paperswithcode/ml-code-completeness-checklist-e9127b168501), [ML Reproducibility Checklist](https://www.cs.mcgill.ca/~jpineau/ReproducibilityChecklist.pdf)                                                |
| 12  | Test and Validate       | [AWS](https://aws.amazon.com/), [GCP](https://cloud.google.com/), [CodeOcean](https://codeocean.com/)                                                                                                                                                          |

## Practices

### 1. Config Management

When you begin implementing your research code, the first line of work is to define an argument parser to define the set of parameters your code expects. These set of hyperparameters can typically look like this:

```bash
python train.py --hidden_dim 100 --batch_size 32 --num_tasks 10 --dropout 0.2 --with_mask --log_interval 100 --learning_rate 0.001 --optimizer sgd --scheduler plateau --scheduler_gamma 0.9 --weight_decay 0.9
```

These sets of arguments typically grow over time in your research project, making maintenance and reproducibility a pain. Typically in your code, you should be careful to log all hyperparameters for all experiments, so that you can replicate an old version of your code. [Pytorch Lightning](https://github.com/PyTorchLightning/pytorch-lightning) provides a great way to log all hyperparameters in `.csv` files in the experiment output folder, allowing for better reproducibility.

An alternative to using a long list of argparse elements is to use config files. Config files can be either in JSON or YAML format (I prefer YAML due to the ability to add comments), where you can set your hyperparams in a logically nested way. The above set of hyperparams could be organized as:

```yaml
# config.yaml
general: # for generic args
  batch_size: 32
  num_tasks: 10
  with_mask: False
  log_interval: 100
optim: # for optimizer args
  learning_rate: 0.001
  optimizer: sgd
  scheduler: plateau
  scheduler_gamma: 0.9
  weight_decay: 0.9
model:
  hidden_dim: 100
```

[OmegaConf](https://github.com/omry/omegaconf) (part of [Hydra](https://hydra.cc)) is a great library that allows you to maintain these config files while providing added flexibility to import previous config files and modify only a few values.

### 2. Checkpoint Management

Managing your model checkpoints is very important in terms of reproducibility, as it allows you to release trained models for the community to easily verify your work, as well as build upon it. Ideally, you should save your checkpoints as frequently as possible. Given the system resource restrictions, it is usually not feasible. Thus, it is ideal to save the last checkpoint along with the checkpoint of the _last best model_ (according to your evaluation metrics). [Pytorch Lightning](https://github.com/PyTorchLightning/pytorch-lightning) provides an in-built solution to do this efficiently.

### 3. Logging

When training your model, you realize that for several parameters it is not giving you the ideal performance. Ideally, you want to check several things. Is the training loss of the model saturating? Is it still going down? How is the validation performance over training look like? You need to log all the metrics efficiently, and later plot those metrics in nice shiny plots for analysis and inspection.

Logging is also important for reproducibility, so researchers can verify the training progression of their replications in great detail.

In the bare-bones setup, you could just log all metrics in the filesystem and then plot by loading them in a python script using matplotlib. To make this process easy and also to provide live, interactive plots, several services are available now which you can leverage in your work. [Tensorboard](https://www.tensorflow.org/tensorboard), for example, is popular in the ML community primarily for its early adoption and ability to deploy locally. Newer entrants, like [Comet.ML](https://www.comet.ml/site/), [WandB](https://www.wandb.com/) or [MLFlow](https://mlflow.org/), provide exciting features ranging from sharable online logging interfaces, with fine-grained ability to monitor experiments and hyperparams. In a future blog post, we will discuss on the pros and cons of these systems.

### 4. Setting the seed

Probably the most important aspect of the exact reproducibility of your research is the seed of the experiment. Although exact reproducibility is not guaranteed, especially in GPU execution environments [[2](https://docs.nvidia.com/deeplearning/sdk/cudnn-developer-guide/index.html#reproducibility), [8](https://pytorch.org/docs/stable/notes/randomness.html)], it's still beneficial to report the seed due to its impact on your results.

When you begin your experiments, it suggested to first set the seed using scripts like these (assuming if you use PyTorch):

```python
def set_seed(seed):
    """Set seed"""
    random.seed(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    if torch.cuda.is_available():
        torch.cuda.manual_seed(seed)
        torch.cuda.manual_seed_all(seed)
        torch.backends.cudnn.deterministic = True
        torch.backends.cudnn.benchmark = False
    os.environ["PYTHONHASHSEED"] = str(seed)
```

**Do not optimize the seed like a hyperparameter. If your algorithm only works on a range of seeds, it's not a robust contribution.**

Reporting the performance of your model on _multiple seeds_ captures the variance of the proposed model. Before beginning your experiments, randomly draw $n$ seeds and set them aside in your config file, and report all experimental results aggregated over those $n$ seeds. $n=5$ is a good starting point, but you an always increase this number.

### 5. Version Control

To track your research effectively, we highly recommended practice setting up version control using `git` in your repository from the get-go. You can use a service like [Github](https://github.com) or [Gitlab](https://gitlab.com/) as your hosting provider.

Use `git commit`s to explain to your future self (and your collaborators) what change you made to your experiment at a given time. Ideally, you should _always commit before you run an experiment_, so that you can `tag` the results with specific commits. Be as detailed with your commit messages as you can - your future self will thank you!

Check out the [commits](https://github.com/huggingface/transformers/commit/9996f697e3ed7a0d6fe4348953723ad6b9d51477) from [Huggingface/transformers](https://github.com/huggingface/transformers) repository for a nice example.

### 6. Data Management

Managing your data is extremely important for reproducibility, especially when you propose a new dataset or a new dataset split. In your many rounds of experiments, you would probably work with different splits of the data, hence tracking all those changes should have similar priority as tracking your code.

The easiest way to track your data is to add it to the git version system or use cloud storage solutions such as Google Drive, AWS S3 to store your datasets.

For large datasets, you can also use [`git-lfs`](https://git-lfs.github.com/), or maintain a md5 hash of the dataset in your config file, like this:

```python
def md5_update_from_dir(directory: Union[str, Path], hash: Hash) -> Hash:
    assert Path(directory).is_dir()
    for path in sorted(Path(directory).iterdir(), key=lambda p: str(p).lower()):
        hash.update(path.name.encode())
        if path.is_file():
            hash = md5_update_from_file(path, hash)
        elif path.is_dir():
            hash = md5_update_from_dir(path, hash)
    return hash


def md5_dir(directory: Union[str, Path]) -> str:
    return str(md5_update_from_dir(directory, hashlib.md5()).hexdigest())
```

[Source - StackOverflow](https://stackoverflow.com/a/54477583)

Having such a hash will allow you to track which dataset or data split you were working on at a certain commit.

### 7. Data Analysis

Keeping track of the analysis you perform on the data/results is also very important in terms of the reproducibility of your contribution. [Jupyter Notebooks](https://jupyter.org) are the standard in maintaining all your analysis and plotting functions in one place. Ideally, you should separate notebooks for data analysis, result analysis, plot generation, and table generation, and add them in your version control. Pandas' [to_latex](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.to_latex.html) allows you to directly write your results as a latex table, removing error-prone copying of results into LaTeX.

When you need to update the results in your paper, you can just access the corresponding file and re-run the cells. You can also parameterize and run notebooks with the [papermill API](https://github.com/nteract/papermill#execute-via-the-python-api) so that your notebooks are cleanly executed your desired analysis parameters.

Maintaining Jupyter Notebooks can get tricky over time. Consider following the best practices [[1](https://arxiv.org/abs/1810.08055)] and use [Jupter contrib nbextensions](https://github.com/ipython-contrib/jupyter_contrib_nbextensions) to supercharge your notebooks!

### 8. Reporting Results

When reporting your results, it is ideal to run your experiments in different seeds and/or different datasets. Thus, your results should contain plots with error bars and tables with standard deviations. You should also describe how the descriptive statistics were calculated, e.g. mean reward over multiple seeds. Statistical testing and highlighting statistically significant values is also encouraged [[9](https://arxiv.org/abs/1904.10922)]. This information provides a more realistic assessment of the performance of a model and avoids the sharing of overly optimistic results [[4](http://proceedings.mlr.press/v97/bouthillier19a.html),[5](https://arxiv.org/abs/1711.10337),[6](https://arxiv.org/abs/1709.06560),[7](https://arxiv.org/abs/1909.06674)].

A higher bar of reproducibility is to report the results on _multiple datasets_ to highlight the robustness of your model. Even if the model has larger variance over different datasets, its still encouraged to report them all - to avoid the discovery of these issues later on.

While reporting your results, consult the [ML Reproducibility Checklist](https://www.cs.mcgill.ca/~jpineau/ReproducibilityChecklist.pdf) which has detailed guidelines on the best practices for reporting figures and tables.

### 9. Managing Dependencies

Irreproducibility often stems from software deprecation. To replicate a published work, the first thing to do is to match the same development environment, containing the same libraries that the program expects. Thus, it is crucial to document the libraries and their versions that you use in your experiments. After your experiments are stable, you can leverage `pip` or `conda` to collect all libraries that have been used:

```bash
$ pip freeze > requirements.txt
$ conda env export > environment.yml
```

You can also leverage headless virtual machines such as [Docker](https://www.docker.com/) or [Singularity](https://sylabs.io/docs/) to provide the exact reproducible dev environment used for the experiments. Singularity, in particular, is supported in many HPC systems (such as [Compute Canada](https://www.computecanada.ca/)), which can be used to train and then subsequently release your experiments to the public. You can also convert your existing repository into a Docker environment using [repo2docker](https://github.com/jupyter/repo2docker).

### 10. Open Source Release

After you have published your paper, consider open sourcing your experiments. This not only encourages reproducible research but also adds more visibility to your paper. Once you release your code, consider adding it to [Papers With Code](https://paperswithcode.com/) for added visibility. You can also release a demo on [Binder](https://mybinder.org) or [Colab](https://colab.research.google.com/) to encourage people to use your model.

For good examples of model demos check out [[10](https://distill.pub/2018/differentiable-parameterizations/)].

Before releasing your code, check the following:

- Squash the commits in the public branch (master) into a single commit
  - Helps remove your private experiment commit messages (and the awkward comments!)
- Make sure your code does not contain any API keys (for loggers such as WandB or Comet.ML)
- Keep an eye out for hardcoded file paths
- Improve readability of your code using formatters such as [Black](https://pypi.org/project/black/). Obscure, poorly written codebases, even when they run, are oftentimes impossible to reuse or build on top of
- Document your functions and classes appropriately. In ML, it's beneficial to the reader if you annotate your code with input and output tensor dimensions.

### 11. Effective Communication

When releasing your code, try to add as much information about the code in the README file. [Papers With Code](https://paperswithcode.com/) released [ML Code Completeness checklist](https://medium.com/paperswithcode/ml-code-completeness-checklist-e9127b168501), which suggests adding the following in your README:

- Dependency information
- Training scripts
- Evaluation scripts
- Pre-trained models
- Results

[Papers With Code](https://paperswithcode.com/) evaluated repositories released after NeurIPS 2019 and found repositories that do not address any of the above only got a median of 1.5 Github stars, whereas repositories which have all five of the above criteria got **196.5** median stars! Only 9% of the repositories fulfilled the 5 points, so definitely we can do better about communicating our research. The better the communication, the better it is in terms of reproducibility.

You should always mention clearly the source of the dataset used in the work. If you are releasing a new dataset or pretrained model for the community, consider adding proper documentation for easy access, such as a [datasheet](https://arxiv.org/abs/1803.09010) or [model card](https://arxiv.org/abs/1810.03993). These are READMEs for the dataset or model which contains:

- Motivation
- Composition
- Collection Process
- Preprocessing
- Use cases
- Distribution
- Maintenance

Read the papers [[3](https://arxiv.org/abs/1803.09010), [11](https://arxiv.org/abs/1810.03993)] for more details on these questions and how to address them. You can choose to publish your dataset either through Github repository or through [Zenodo](https://zenodo.org/).

### 12. Test and Validate

Finally, it's important from the reproducibility perspective to test your implementation in a _different environment_ than the training setup. This testing doesn't necessarily mean you have to re-train the entire pipeline. Specifically, you should make sure that the training and evaluation scripts are running in the test environment.

To get an isolated test environment, you can use AWS or GCP cloud instances. You can also checkout [CodeOcean](https://codeocean.com/) which provides isolated AWS instances tied to Jupyter Notebooks for easy evaluation.

## Final Thoughts

Reproducibility is hard. Maintaining a reproducible research codebase is harder when the incentive is to publish your ideas quicker than your competitor. Nevertheless, we agree with what Joelle Pineau said in NeurIPS 2018 : [_"Science is not a competitive sport"_](https://www.facebook.com/watch/live/?v=2120856364798049&ref=watch_permalink). We need to invest more time and care in our research, and we need to ensure as computer scientists our work is reproducible so that it adds value to the reader and practitioners who would build upon our work.

We hope this post will be useful in your research. Feel free to comment if you have any particular point/libraries that we missed, we would be happy to add them.

## Acknowledgements

Many thanks to Joelle Pineau for encouraging writing this draft, and helping formulating the best practices. Thanks to Shagun Sodhani, Matthew Muckley and Michela Paganini for providing feedback on the draft. Thanks to [Deep Learning for Science School](https://dl4sci-school.lbl.gov/) for inviting Koustuv to speak about reproducibility on August 2020, for which this blog post is a point of reference.

## References

1. Rule A, Birmingham A, Zuniga C, Altintas I, Huang SC, Knight R, Moshiri N, Nguyen MH, Rosenthal SB, Pérez F, Rose PW. [Ten simple rules for reproducible research in Jupyter notebooks](https://arxiv.org/abs/1810.08055). arXiv preprint arXiv:1810.08055. 2018 Oct 13.
2. [Nvidia CUDNN Developer Guides](https://docs.nvidia.com/deeplearning/sdk/cudnn-developer-guide/index.html#reproducibility)
3. Gebru T, Morgenstern J, Vecchione B, Vaughan JW, Wallach H, Daumé III H, Crawford K. [Datasheets for datasets](https://arxiv.org/abs/1803.09010). arXiv preprint arXiv:1803.09010. 2018 Mar 23.
4. Bouthillier X, Laurent C, Vincent P. [Unreproducible research is reproducible](http://proceedings.mlr.press/v97/bouthillier19a.html). In International Conference on Machine Learning 2019 May 24 (pp. 725-734).
5. Lucic M, Kurach K, Michalski M, Gelly S, Bousquet O. [Are GANs created equal? a large-scale study](https://arxiv.org/abs/1711.10337). In Advances in Neural Information Processing Systems 2018 (pp. 700-709).
6. Henderson P, Islam R, Bachman P, Pineau J, Precup D, Meger D. [Deep Reinforcement learning that matters](https://arxiv.org/abs/1709.06560). In Thirty-Second AAAI Conference on Artificial Intelligence 2018 Apr 29.
7. Raff E. [A Step Toward Quantifying Independently Reproducible Machine Learning Research](https://arxiv.org/abs/1909.06674). In Advances in Neural Information Processing Systems 2019 (pp. 5485-5495).
8. [Pytorch note on reproducibility](https://pytorch.org/docs/stable/notes/randomness.html)
9. Forde JZ, Paganini M. [The Scientific Method in the Science of Machine Learning](https://arxiv.org/abs/1904.10922). In ICLR Debugging Machine Learning Models Workshop 2019.
10. Mordvintsev A, Pezzotti N, Schubert L, Olah C. [Differentiable Image Parameterizations](https://distill.pub/2018/differentiable-parameterizations/). Distill 2018.
11. Mitchell M, Wu S, Zaldivar A, Barnes P, Vasserman L, Hutchinson B, Spitzer E, Raji ID, and Gebru T. [Model Cards for Model Reporting](https://arxiv.org/abs/1810.03993). In Proceedings of the Conference on Fairness, Accountability, and Transparency (FAT\* ’19). Association for Computing Machinery, New York, NY, USA, 220–229.
