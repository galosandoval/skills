# Skills

A collection of agent skills (slash commands and behaviors) loaded by Claude Code. Skills are organized into buckets and consumed by per-repo configuration emitted by `/setup-skills`.

## Fork relationship

This repo is a fork of [mattpocock/skills](https://github.com/mattpocock/skills), tracked as the `upstream` remote (`origin` is `galosandoval/skills`). Most of `engineering/` and `productivity/` came from upstream and still take changes from it; `skills/personal/` is original to this fork.

Two skills were **deliberately renamed** so the fork stops presenting as Matt's:

| Upstream                  | Here           |
| ------------------------- | -------------- |
| `ask-matt`                | `ask-galo`     |
| `setup-matt-pocock-skills` | `setup-skills` |

The renames cost something on every sync. A `git merge upstream/main` that touches either directory conflicts as an add/add or a delete/modify, because upstream still has the old path. **Resolve it by applying the upstream change to the renamed directory and deleting the old path — never by resurrecting `ask-matt/` or `setup-matt-pocock-skills/`.** The same goes for their docs pages (`docs/engineering/ask-galo.md`, `docs/engineering/setup-skills.md`) and for any cross-reference upstream adds using the old slug; rewrite the slug as part of the resolution. This is accepted, ongoing cost — the alternative is a fork that permanently reads as someone else's.

Docs pages under `docs/` are **repo-only** here. Upstream publishes them to `aihero.dev` and links absolutely; this fork does not publish, so its pages link relatively. An upstream sync that introduces an `https://aihero.dev/skills-<name>` link should be resolved to the relative equivalent (see [.agents/writing-docs.md](./.agents/writing-docs.md)).

## Language

**Issue tracker**:
The tool that hosts a repo's issues — GitHub Issues, Linear, a local `.scratch/` markdown convention, or similar. Skills like `to-tickets`, `to-spec`, and `triage` read from and write to it.
_Avoid_: backlog manager, backlog backend, issue host

**Issue**:
A single tracked unit of work inside an **Issue tracker** — a bug, task, spec, or slice produced by `to-tickets`.
_Avoid_: ticket (use only when quoting external systems that call them tickets, or for a **Decision ticket** — see below)

**Decision ticket**:
A `wayfinder` unit — a child **Issue** of a `wayfinder:map` holding a *question* whose resolution is a decision, not a slice of a build to execute. The **decision** qualifier is what keeps it distinct from an implementation ticket; `wayfinder` introduces the term, then uses "ticket".

**Triage role**:
A canonical state-machine label applied to an **Issue** during triage (e.g. `needs-triage`, `ready-for-afk`). Each role maps to a real label string in the **Issue tracker** via `docs/agents/triage-labels.md`.

## Relationships

- An **Issue tracker** holds many **Issues**
- An **Issue** carries one **Triage role** at a time
- A **Decision ticket** is an **Issue** (a child of a `wayfinder:map`)

## Flagged ambiguities

- "backlog" was previously used to mean both the *tool* hosting issues and the *body of work* inside it — resolved: the tool is the **Issue tracker**; "backlog" is no longer used as a domain term.
- "backlog backend" / "backlog manager" — resolved: collapsed into **Issue tracker**.
