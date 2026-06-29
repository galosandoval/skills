---
paths:
  - "**/*.go"
---

# Go Style Guidelines

## File Size Guidelines

These are soft guidelines to encourage readable, maintainable code.

### Functions

- **Aim for ~80 lines max** per function
- When a function grows large, consider:
  - Extracting helper functions
  - Breaking into smaller, single-responsibility functions
  - Using early returns to reduce nesting

### Handlers & Services

- **Consider splitting when approaching 150 lines**
- Large handlers often indicate mixed concerns
- Extract business logic into service methods

## Code Colocation

- **Keep code close to where it's used** - Helper functions should live near their consumers
- **Don't export unless needed elsewhere** - Use unexported (lowercase) functions until they're actually needed outside the package
- **Only extract to separate files when reused** - If a function is only used in one place, keep it in the same file

## When Files Get Large

If you notice a file exceeding these guidelines:

1. **First, check if code is reused** - Only extract to separate files if the code is used in multiple places
2. **Extract helper functions** - Move logic into unexported functions in the same file first
3. **Split by responsibility** - Only separate into different files when the code is genuinely reused
4. **Consider new packages** - Only if logic is distinct and used across multiple packages

## Rationale

Smaller functions and files are:
- Easier to read and understand
- Simpler to test in isolation
- Less prone to bugs
- More reusable across the codebase
