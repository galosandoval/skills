---
"galosandoval-skills": minor
---

**`/implement` now has a commit discipline for unattended runs.** The skill previously ended on "Wait for the user to approve the work before committing" — correct with a human in the loop, and a work-destroying instruction without one. A harness that spawns `/implement` to run on its own has nobody to approve anything and no turn after the one the model stops on, so an agent that did the work, passed the gate, and then waited lost all of it.

- **Two contexts, stated.** Interactive runs keep approval-before-commit unchanged. A headless run commits the implementation the moment the full suite passes — before `/code-review`, before browser verification, before tidying — and everything after that becomes a second commit. The harness's prompt says which context is in force.
- **No more ending a turn on a wait.** A headless run is told explicitly that stopping ends the run and that uncommitted work is discarded, so "I'll pause here and wait for the background task" stops being a reachable way to finish.
- **Long-running commands have a procedure.** Pass an explicit timeout rather than letting the default background the command; never pipe a slow command through `tail`/`head`/`grep`, because the filter buffers and an empty output file makes a hang indistinguishable from progress; poll the file instead of burning turns on `true`, `echo` and `sleep`; and budget the command, killing it and finishing the run when the budget is spent.
- **A side effect on `/code-review`.** Reviewing before committing is why it reports seeing no changes — the diff it reads excludes the working tree. Headless runs no longer hit this, because the commit already happened.
