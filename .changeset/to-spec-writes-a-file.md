---
"galosandoval-skills": minor
---

**`/to-spec` writes a markdown file instead of publishing an issue.** The spec now lands at `.scratch/<feature-slug>/spec.md` (or a markdown path you pass it), and the skill never creates, edits, or labels an issue. Publishing to the issue tracker is `/to-tickets`' job alone.

- **No more `ready-for-agent` on the spec.** The label made AFK agents polling the tracker try to build the whole spec in one run instead of picking up the ticket slices. A spec is a document, not a unit of work.
- **No more truncated specs.** `/to-tickets` reads the spec off disk — pass the path — instead of fetching back a tracker issue body that could be served back incomplete. Running both in one context window is still the cheapest path, but it is no longer load-bearing.
- **`/to-spec` no longer needs `/setup-skills`.** It moves from hard dependency to soft: it still sharpens the spec with `CONTEXT.md` and ADRs when they exist, and works without a tracker configured. An issue number or URL passed as an argument (a cleared `/wayfinder` map, say) is still read as *input*.
