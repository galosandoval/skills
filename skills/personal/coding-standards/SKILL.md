---
name: coding-standards
description: My coding standards for TypeScript, React, Go, and Prisma — file and function size, colocation, props typing, hooks and state, JSX patterns, mobile-first layout, doc comments, third-party wrappers, and migration workflow. Use when writing, reviewing, or refactoring TypeScript/TSX/JS/Go code; when building or restyling any UI, laying out a screen, or writing Tailwind and responsive classes; when deciding whether to extract a component, hook, function, or file; when typing React props or choosing between useState calls; when writing a comment or JSDoc block; when wrapping a third-party library in a hook or utility; or when creating, editing, or resolving a Prisma migration.
---

# Coding Standards

My standards for the languages and tools I actually use. **Read only the reference files that apply to the code in front of you** — don't load the whole set.

## Which reference to read

| Read this | When |
| --- | --- |
| `references/typescript-style.md` | Any `.ts`/`.tsx` work. File, component, and function size; colocation; when to extract vs. keep in-file. The baseline — read it first for TypeScript. |
| `references/react-preferences.md` | Any `.tsx` work, **and any UI or layout work at all**. Props typing, function-declaration components, hooks and `useState`, store actions, JSX conditionals, mobile-first Tailwind layout, exports and barrels. |
| `references/doc-comments.md` | Writing or reviewing a comment in `.ts`/`.tsx`/`.js`/`.jsx`. JSDoc/TSDoc over inline `//` for named declarations. |
| `references/third-party-encapsulation.md` | Wrapping a library in a hook or utility — or deciding not to. Covers when a wrapper earns its keep and when it's pure indirection. |
| `references/go-style.md` | Any `.go` work. Function, handler, and service size; unexported-by-default; when to split a file or package. |
| `references/prisma-migrations.md` | Anything under `prisma/` or a `.prisma` file. `migrate dev` vs. `deploy` vs. `resolve`, drift, drops, and why never `db push`. |

Common combinations: a React component pulls `typescript-style` + `react-preferences`; add `doc-comments` if you're documenting anything, and `third-party-encapsulation` if a library is involved.

## Guiding principle

When you look at any given piece of code, you should be able to tell what everything does. Names, structure, and size should make each part self-explanatory without hunting through the file or jumping elsewhere.

Everything in the references serves that. The size numbers are soft signals for *reconsider this*, not hard limits — and the default answer to "this file is long" is to extract **within the same file**, not to spawn a new one. Only reuse across files justifies a new file.

## Applying them

- Follow the standards in code you write or change. Don't reformat untouched surrounding code to match.
- Where an existing file consistently does something else, match the file and mention the divergence — don't half-migrate it mid-task.
- These are my preferences, not universal law. If a standard actively fights the task, say so rather than contorting the code around it.
