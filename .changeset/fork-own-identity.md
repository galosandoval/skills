---
"galosandoval-skills": major
---

Make this fork its own repository rather than a copy still wearing upstream's name.

**Licence.** `LICENSE` keeps the MIT grant and Matt Pocock's copyright, adds a copyright line for this fork's own contributions, and gains a provenance section naming the upstream repo and giving a `git log --diff-filter=A` recipe so anyone copying a file out can tell whose notice to reproduce instead of guessing.

**Identity.** The plugin is `galosandoval-skills`, the skills.sh badge and quickstart install `galosandoval/skills`, and every docs page's install line does the same. `README.md` credits the fork's origin in prose and stops claiming upstream's newsletter as its own.

**Renames.** `/ask-matt` is now `/ask-galo` and `/setup-matt-pocock-skills` is now `/setup-skills`, in the skill directory, frontmatter, heading, docs page, and every cross-reference. Anyone with the old skills installed should re-run `scripts/link-skills.sh` and drop the stale symlinks.

**Docs are repo-only.** Upstream publishes these pages to `aihero.dev` and so mandates absolute links; this fork does not publish, so `.agents/writing-docs.md` and `CLAUDE.md` now require repo-relative links, and all 22 pages have been converted (a stale `to-prd` link in `research.md` now points at `to-spec`).

**Fork relationship recorded.** `CONTEXT.md` gains a section covering what the fork is, which remote is upstream, which skills were deliberately renamed, and how to resolve an upstream sync that touches a renamed directory — apply the change to the new path, never resurrect the old one.
