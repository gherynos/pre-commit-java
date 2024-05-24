# pre-commit-java

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/gherynos/pre-commit-java)
[![update](https://github.com/gherynos/pre-commit-java/actions/workflows/update.yaml/badge.svg)](https://github.com/gherynos/pre-commit-java/actions/workflows/update.yaml)

A collection of git hooks for Java to be used with the [pre-commit framework](http://pre-commit.com).

## Requirements

pre-commit-java requires the following to run:

* [pre-commit](http://pre-commit.com)
* [Docker](https://www.docker.com)

## Install

1. create `.pre-commit-config.yaml` in you git project
2. pre-commit install
3. enjoy :)

example `.pre-commit-config.yaml`:

```yaml
- repo: https://github.com/gherynos/pre-commit-java
  rev: v0.2.1  # Use the ref you want to point at
  hooks:
    - id: pmd
      exclude: /test/
    - id: cpd
      exclude: /test/
    - id: checkstyle
      exclude: /test/
    # ...
```

## Available Hooks

| Hook name    | Description                                                                                   |
|--------------|-----------------------------------------------------------------------------------------------|
| `pmd`        | Runs the [PMD](https://pmd.github.io) static code analyzer.                                   |
| `cpd`        | Runs the [Copy/Paste Detector (CPD)](https://pmd.github.io/pmd-6.22.0/pmd_userdocs_cpd.html). |
| `checkstyle` | Runs the [Checkstyle](https://checkstyle.sourceforge.io) static code analysis tool.           |

### Notes about the `pmd` hook

The default ruleset used is [ruleset.xml](https://github.com/gherynos/pre-commit-java/blob/master/ruleset.xml), which runs all the Java rules, except for `LoosePackageCoupling`.

To specify a custom ruleset, simply pass the argument to the hook:

```yaml
    - id: pmd
      args: ["-R=my_ruleset.xml"]
```

Furthermore, the default language version passed to PMD is `java-17`, which can be tweaked using the `--use-version` argument.

Other [CLI](https://pmd.github.io/latest/pmd_userdocs_cli_reference.html#options) arguments are also supported, like `--cache` for incremental analysis.

The arguments must be specified using the `--<arg>=<value>` (`-<arg>=<value>`) convention, as opposed to `--<arg> <value` (`-<arg> <value`) to avoid parsing errors.

### Notes about the `cpd` hook

The default minimum token length is 100.

To change it, simply pass the argument to the hook:

```yaml
    - id: cpd
      args: ["--minimum-tokens=50"]
```

Other [CLI](https://pmd.github.io/latest/pmd_userdocs_cpd.html#cli-usage) arguments are also supported.

The arguments must be specified using the `--<arg>=<value>` (`-<arg>=<value>`) convention, as opposed to `--<arg> <value` (`-<arg> <value`) to avoid parsing errors.

### Notes about the `checkstyle` hook

The default configuration used is [sun_checks.xml](https://github.com/checkstyle/checkstyle/blob/master/src/main/resources/sun_checks.xml).

To specify a custom one, simply pass the argument to the hook:

```yaml
    - id: checkstyle
      args: ["-c", "my_checks.xml"]
```

Other [CLI](https://checkstyle.org/cmdline.html) arguments are also supported.

Other configurations [part of the distribution](https://github.com/checkstyle/checkstyle/tree/master/src/main/resources) can be used like:

```yaml
    - id: checkstyle
      args: ["-c", "/google_checks.xml"]
```

## Author

> GitHub [@gherynos](https://github.com/gherynos)

## License

pre-commit-java is licensed under the [GPLv3](https://github.com/gherynos/pre-commit-java/blob/master/LICENSE) license.
