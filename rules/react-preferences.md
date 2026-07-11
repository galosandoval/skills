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
- Call store actions via the destructured selector, not `store.getState().setX()` — inside a component/hook, pull the action out (`const { setFoo } = useStore()`) and call `setFoo(...)`. Actions are stable, so this is safe and reads better.
  - Exception: `store.getState()` is fine (and preferred) for reading **mutable state** inside async callbacks/event handlers, where a destructured value would be a stale closure. Only the setter calls should be destructured.

```ts
// avoid
useChatStore.getState().setPendingExpandRecipeId(id)
// prefer
const { setPendingExpandRecipeId } = useChatStore()
setPendingExpandRecipeId(id)

// still correct — fresh read in an async handler
const chatId = useChatStore.getState().chatId
```

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
