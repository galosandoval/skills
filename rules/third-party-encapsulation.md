---
paths:
  - "**/*.{ts,tsx}"
---

# Third-Party Library Encapsulation

## Why Encapsulate

Wrap third-party libraries in custom hooks or utilities to:
- Add type safety and autocomplete that the library may lack
- Simplify the API for your specific use case
- Make it easy to swap implementations later
- Centralize configuration and defaults

## Pattern

Create a custom hook in `hooks/` that wraps the library:

```typescript
// hooks/use-translations.ts
import { useTranslations as useNextIntlTranslations } from 'next-intl'
import type messages from '@/messages/en.json'

type Messages = typeof messages
type Namespace = keyof Messages
type NamespacedKey<N extends Namespace> = keyof Messages[N] & string

export function useTranslation<N extends Namespace>(namespace: N) {
  const t = useNextIntlTranslations(namespace) as any
  return {
    t: (key: NamespacedKey<N>) => t(key) as string
  }
}
```

## Benefits

- **Type inference from data**: Derive types from JSON, schemas, or configs
- **Autocomplete**: Users get suggestions from your actual data structure
- **Single import**: Components import from your hook, not the library
- **Easy migration**: Swap libraries without changing component code

## When to Apply

- i18n libraries (next-intl, react-i18next)
- Form libraries (react-hook-form, formik)
- State management (zustand, jotai)
- Any library where you want stricter types or simpler API
