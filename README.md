# terragrunt-graph-issues
This repo demonstrates issues I've encountered while using `terragrunt graph`.

# Table of Contents
* [Initial Setup](#initial-setup)
* [Issues](#issues)
  * [Issue 1: --terrgrunt-working-dir does not work properly](#issue-1---terrgrunt-working-dir-does-not-work-properly)

## Initial Setup
Run `terragrunt run-all apply` on top level of the repository.

## Issues

### Issue 1: --terrgrunt-working-dir does not work properly
Executing `terragrunt graph` with --terragrunt-working-dir acts different as jumping into the dir with `cd` and
executing `terragrunt graph` there.

#### Reproduction
Everything works fine if we jump into the directory:
```zsh
➜  terragrunt-graph-issues git:(main) ✗ cd live/accounts/dev/eu-central-1/level-0
➜  level-0 git:(main) ✗ terragrunt graph validate
INFO[0000] The stack at /home/lmaraite/go/src/github.com/lmaraite-devk/terragrunt-graph-issues will be processed in the following order for command validate:
Group 1
- Module /home/lmaraite/go/src/github.com/lmaraite-devk/terragrunt-graph-issues/live/accounts/dev/eu-central-1/level-0

Group 2
- Module /home/lmaraite/go/src/github.com/lmaraite-devk/terragrunt-graph-issues/live/accounts/dev/eu-central-1/level-1

Success! The configuration is valid.

INFO[0000] Downloading Terraform configurations from file:///home/lmaraite/go/src/github.com/lmaraite-devk/terragrunt-graph-issues/modules/echo into /home/lmaraite/go/src/github.com/lmaraite-devk/terragrunt-graph-issues/live/accounts/dev/eu-central-1/level-0/.terragrunt-cache/OSF6hh3PRkeoHK90cE-WwNpox9Y/LUMgVQAUKRtrfn_pNJw4s5CQ8G0  prefix=[/home/lmaraite/go/src/github.com/lmaraite-devk/terragrunt-graph-issues/live/accounts/dev/eu-central-1/level-1]
Success! The configuration is valid.
```
But if we use `--terragrunt-working-dir`, the graph gets validated, but the stack order & if the stack is valid will not be evaluated:
```zsh
➜  terragrunt-graph-issues git:(main) ✗ terragrunt graph validate --terragrunt-working-dir live/accounts/dev/eu-central-1/level-1
INFO[0000] The stack at /home/lmaraite/go/src/github.com/lmaraite-devk/terragrunt-graph-issues will be processed in the following order for command validate:
```
