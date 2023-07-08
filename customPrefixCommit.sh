#!/usr/bin/env bash

if [ -z "$1" ]; then
	echo "Missing commit message; or ran manually!"
	exit 1
fi

commit_message="$(cat $1 | head -n1)"

# ignore MR/PR
if echo "$commit_message" | grep -qE "Merge branch"; then
	echo "Commit hook: ignoring branch merge"
	exit 0
fi

# versioning scheme
if ! echo "$commit_message" | grep -qE '^((\w+\/)?([A-Z]+[-_])?[0-9]+: )(feat|fix|bugfix|hotfix|docs|style|refactor|perf|test|chore)\(?(?:\w+|\s|\-|_)?\)?:\s\w+'; then
	echo "[ERROR]: Aborting commit. Your commit message is invalid: $commit_message"
	exit 1
fi

# length scheme
if ! echo "$commit_message" | grep -qE "^.{1,100}$"; then
	echo "[ERROR]: Aborting commit. Your commit message is too long: $commit_message"
	exit 1
fi
