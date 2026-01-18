# 4. Client-Side Data Fetching

**Impact: MEDIUM-HIGH**

Automatic deduplication and efficient data fetching patterns reduce redundant network requests.

## 4.1 Deduplicate Global Event Listeners

**Impact: LOW (single listener for N components)**

Use `useSWRSubscription()` or a module-level Map to share global event listeners across component instances.

**Correct: N instances = 1 listener**

```tsx
import useSWRSubscription from 'swr/subscription'

const keyCallbacks = new Map<string, Set<() => void>>()

function useKeyboardShortcut(key: string, callback: () => void) {
  useEffect(() => {
    if (!keyCallbacks.has(key)) keyCallbacks.set(key, new Set())
    keyCallbacks.get(key)!.add(callback)
    return () => {
      const set = keyCallbacks.get(key)
      if (set) {
        set.delete(callback)
        if (set.size === 0) keyCallbacks.delete(key)
      }
    }
  }, [key, callback])

  useSWRSubscription('global-keydown', () => {
    const handler = (e: KeyboardEvent) => {
      if (e.metaKey && keyCallbacks.has(e.key)) {
        keyCallbacks.get(e.key)!.forEach(cb => cb())
      }
    }
    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  })
}
```

## 4.2 Use SWR for Automatic Deduplication

**Impact: MEDIUM-HIGH (automatic deduplication)**

SWR enables request deduplication, caching, and revalidation across component instances.

```tsx
import useSWR from 'swr'

function UserList() {
  const { data: users } = useSWR('/api/users', fetcher)
}
```

---

# 5. Re-render Optimization

**Impact: MEDIUM**

## 5.1 Defer State Reads to Usage Point

Don't subscribe to dynamic state if you only read it inside callbacks.

**Correct: reads on demand, no subscription**

```tsx
function ShareButton({ chatId }: { chatId: string }) {
  const handleShare = () => {
    const params = new URLSearchParams(window.location.search)
    const ref = params.get('ref')
    shareChat(chatId, { ref })
  }
  return <button onClick={handleShare}>Share</button>
}
```

## 5.2 Extract to Memoized Components

Extract expensive work into memoized components to enable early returns before computation.

## 5.3 Narrow Effect Dependencies

Specify primitive dependencies instead of objects to minimize effect re-runs.

## 5.4 Subscribe to Derived State

Subscribe to derived boolean state instead of continuous values (e.g., use `useMediaQuery` instead of `useWindowWidth`).

## 5.5 Use Functional setState Updates

When updating state based on the current state value, use the functional update form of setState.

```tsx
const addItems = useCallback((newItems: Item[]) => {
  setItems(curr => [...curr, ...newItems])
}, []) 
```

## 5.6 Use Lazy State Initialization

Pass a function to `useState` for expensive initial values.

```tsx
const [searchIndex, setSearchIndex] = useState(() => buildSearchIndex(items))
```

## 5.7 Use Transitions for Non-Urgent Updates

Mark frequent, non-urgent state updates as transitions to maintain UI responsiveness.
