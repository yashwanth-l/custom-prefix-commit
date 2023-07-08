# custom-prefix-commit

## Motivation

With this pre-commit you will be able to validate a ticket number to your commit message and also a semantic-commit message. e.g. your commit has following message: `JIRA-1234: feat: added new feature` or `JIRA_1234: feat: added new feature`

The following semantic message prefix is supported:

- feat
- bugfix
- hotfix
- fix
- docs
- style
- refactor
- perf
- test
- chore

## Setup

For the setup of add the following to your `.pre-commit-config.yaml`:

```yaml
repos:
  # Other repos
  # ...
  # ...
  - repo: https://github.com/yashwanth-l/custom-prefix-commit
    rev: v0.1.0
    hooks:
    - id: customPrefixCommit
```

## FAQ

- `pre-commit install && pre-commit install --hook-type commit-msg`
- If you see error like `Executable '....customPrefixCommit.sh' is not executable`
  - Make the script executable with `chmod +x <hook-path>/customPrefixCommit.sh`
  - Run the commit command again
