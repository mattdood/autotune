# Autotune
Make your database sing.

<img src="https://img.shields.io/github/issues/mattdood/autotune"
    target="https://github.com/mattdood/autotune/issues"
    alt="Badge for GitHub issues."/>
<img src="https://img.shields.io/github/forks/mattdood/autotune"
    target="https://github.com/mattdood/autotune/forks"
    alt="Badge for GitHub forks."/>
<img src="https://img.shields.io/github/stars/mattdood/autotune"
    alt="Badge for GitHub stars."/>
<img src="https://img.shields.io/github/license/mattdood/autotune"
    target="https://github.com/mattdood/autotune/raw/master/LICENSE"
    alt="Badge for GitHub license, MIT."/>
<img src="https://img.shields.io/twitter/url?url=https%3A%2F%2Fgithub.com%2Fmattdood%2Fautotune"
    target="https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fmattdood%2Fautotune"
    alt="Badge for sharable Twitter link."/>
[![Pytest](https://github.com/mattdood/autotune/actions/workflows/ci.yml/badge.svg)](https://github.com/mattdood/autotune/actions/workflows/ci.yml)
[![PyPI version](https://badge.fury.io/py/autotune.svg)](https://badge.fury.io/py/autotune)

## Inspiration
When working on projects it appears to be common that database performance tuning is
and afterthought until there is a bottleneck. This leads to a scramble for diagnosing
and remediating any issues that have cropped up, often unveiling a database configuration
that has been left entirely with default settings.

While intentions are typically good when provisioning data systems, they're often
left with default configs that are suboptimal to the workload they're running under.

To remedy this, `autotune` creates Terraform modules for AWS supported databases
that are pretuned for the expected workload.

## Installation
To install autotune run the following:
```
pip install autotune
```

## Features
* Provision new databases using Terraform modules pretuned to the workload that
you expect.
* Manage configuration files for Terraform modules to ensure outputs can be
consistently recreated across projects.

## Usage
Commands are well documented using `--help`.

```
autotune --help
```

## Running tests
[Pytest](https://pytest.org) is used as the test runner. To install and run tests
use the `requirements-dev.txt` and execute with `pytest`.

**Note:** Use a virtual environment. The steps to create one are left to the user,
there are many packages that accomplish this.

```bash
pip install -r requirements-dev.txt
pytest
```

## Linting code
The project utilizes [Pre-Commit](https://pre-commit.com) to execute linting. This
ensures code quality is solid, and is used both in the CI and the `requirements-dev.txt`
for local execution.

The following hooks are used inside Pre-Commit:
* trailing-whitespace
* check-yaml
* isort
* flake8

To run Pre-Commit, use the following:

```bash
pre-commit run --all-files
```

## TODO
- [ ] Change `autotune` PyPI to `autotune-db` to avoid name conflict on project
- [ ] Create Terraform workflow for adding database engines
    - [ ] Determine engines + major versions supported
    - [ ] Create config ingest format
    - [ ] Documentation generation for TF module output
- [ ] `docs/` directory for working on the project
- [ ] Testable TF modules
    - [ ] internal tool for generating cookiecutter TF modules?


## Development workflow idea
We need to determine a good way to work with the TF settings/params while also
ensuring we're not spinning up lots of instances that are persistent or have burst-style
costs associated with them.

Unforunately, local cloud resource emulation is a bit convoluted and has a cost
associated with it (localstack).

**Note:** We can support Aurora but we should not provision them because it is
expensive. The testing will end at plan and validate.

### Workflow (new module/params)
1. Create Terraform module with parameters
1. Test manually to ensure the `terraform plan` and `terraform validate` work
1. Convert to a cookiecutter styled module with dynamic info
1. Have a test runner use `autotune create` to generate an output in the smallest instance type
1. Run test validations on the output for the module, a TF plan, and then
deploy it, run validations on the resource with SQL setting validator scripts, then destroy

### CI/CD
Terraform CI runner to ensure that the resource modules are usable. This should be
run after the Python linting, because it'll likely be interdependent upon the CLI tool
to actually work.

