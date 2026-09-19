---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
disable-model-invocation: true
---

Implement the work described by the user in the spec or tickets.

Use /tdd where possible, at pre-agreed seams.

Run typechecking regularly, single test files regularly, and the full test suite once at the end.

Once done, use /code-review to review the work.

## Committing

Two contexts, two rules. Work out which one you are in before you start. If a
human is reading your output turn by turn, you are **interactive**. If a
harness spawned you to run to completion on your own, you are **headless** —
the prompt you were given will say so.

**Interactive.** Wait for the user to approve the work before committing.

**Headless.** There is nobody to approve it, and there is no next turn: when
you stop, the run ends, and anything uncommitted is discarded.

- Commit the implementation the moment the full suite passes — before
  /code-review, before any browser verification, before tidying up.
- Everything after that is a second commit on top of the first: review
  findings, verification, screenshots.
- Never end a turn waiting. Not for a background task, not for a notification,
  not for a test run to finish on its own. "I'll pause here and wait" is how a
  run ends with the work thrown away. If something is still going and you have
  nothing else to do, poll it to completion or kill it.

## Long-running commands

A command that outlives its timeout is moved to the background, and you lose
its output. Before running anything slow — a browser suite, a dev server, a
build:

- Pass an explicit timeout rather than letting the default background it out
  from under you.
- Don't pipe it through `tail`, `head` or `grep`. The filter buffers, so the
  backgrounded run's output file stays empty and a hang looks exactly like
  progress. Redirect to a file and read the file.
- If it does get backgrounded, poll that file. Don't spend turns on `true`,
  `echo idle` or `sleep`, and don't stop and hope for a notification.
- Give it a budget. When the budget is spent, kill it, write down what you
  saw, and finish the run — a committed implementation with unfinished
  verification is a usable outcome, an uncommitted one is not.
