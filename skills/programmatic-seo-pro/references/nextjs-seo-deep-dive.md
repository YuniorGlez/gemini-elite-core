# Next.js 16 SEO Features Deep Dive

## The Metadata API
Next.js 16 simplifies SEO by centralizing metadata management in `layout.tsx` and `page.tsx`.

### 1. Static Metadata
```tsx
export const metadata: Metadata = {
  title: 'My Programmatic Site',
  description: 'Scalable content for the AI era.',
};
```

### 2. Dynamic Metadata
```tsx
export async function generateMetadata({ params }): Promise<Metadata> {
  const data = await fetchData(params.slug);
  return {
    title: `${data.name} | My Site`,
    openGraph: { images: [data.imageUrl] },
  };
}
```

---

## Streaming & Perceived Performance
Next.js 16 streams the `<head>` separately from the `<body>`.
- **Benefit**: Search engines get the meta tags instantly, even if the body content takes time to fetch from a slow DB or API.
- **Bot Behavior**: Bots like Googlebot wait for the metadata to resolve before indexing the page.

---

## Caching & Revalidation
### ISR (Incremental Static Regeneration)
Use `revalidate` at the page level or `next: { revalidate: 3600 }` in `fetch`.

### Tag-Based Revalidation
Use `revalidateTag('my-data-tag')` to purge the cache only when the underlying data in your CMS or DB changes. This is the "Elite" way to handle programmatic scale without wasting server resources.

---

## Image & Font Optimization
- **`next/image`**: Automatically serves WebP/AVIF and handles lazy loading. Essential for Core Web Vitals (LCP).
- **`next/font`**: Zero layout shift (CLS) by pre-loading and optimizing fonts locally.
