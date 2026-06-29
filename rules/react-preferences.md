---
paths:
  - "**/*.tsx"
---

# React Preferences

## Props & Typing

- Inline props types in the function signature — don't create a separate interface/type above the component unless reused
- If the inline types are getting cluttered, that's a signal the component may be doing too much — consider rethinking the architecture (splitting the component, composing differently, etc.) rather than just extracting a type
- Export the type when it's reused in other files
- Move to a dedicated file when the type is widely reused across many files

## Components

- Use function declarations for components (`function MyComponent()` not `const MyComponent = () =>`)
- Destructure props in the signature (`({ title, onClick }: { title: string; onClick: () => void })`)

## Hooks & State

- Infer return types on custom hooks — don't annotate unless the type is complex or ambiguous
- Separate `useState` per value — prefer individual calls over grouping into objects

## JSX Patterns

- Early returns for conditional rendering (`if (!data) return null` at the top)
- Extract complex conditions into named variables (`const isVisible = x && y`)
- No nested ternaries in JSX — use early returns or if/else instead
- Self-close tags with no children (`<Component />`)

## Organization

- Only export the top-level component from a file — sub-components stay unexported in the same file
- If a sub-component needs to be exported, move it to its own file
- Co-locate styles with components (same directory)
- No barrel exports — import directly from the file, no `index.ts` re-exports
