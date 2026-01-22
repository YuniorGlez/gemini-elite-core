# AI-PRO Reference: Modern API Integrations (Stripe v13+)

## Overview
In 2026, API consumption has moved towards **fully typed, auto-paginating SDKs**. Stripe SDK v13+ serves as the gold standard for this architecture.

## Stripe SDK v13+ Features
- **Auto-Pagination**: No more manual cursor handling for large lists.
- **Deeply Expanded Objects**: native `expand` support with full TypeScript safety.
- **Event-Driven Resilience**: Standardized webhook handling with automated retry logic.

## Implementation: Auto-Pagination
Fetching all customers used to require a loop. Now it's a native iterator.

```typescript
import Stripe from 'stripe';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY!, {
  apiVersion: '2025-10-01', // Latest stable
});

async function processAllCustomers() {
  const customers = stripe.customers.list({
    limit: 100,
    expand: ['data.subscriptions'], // Deep expansion
  });

  // Auto-pagination using for-await-of
  for await (const customer of customers) {
    console.log(`Processing ${customer.email}`);
    // customer.subscriptions is fully typed here
  }
}
```

## Advanced Object Expansion
V13+ allows for type-safe expansion up to 4 levels deep.

```typescript
const paymentIntent = await stripe.paymentIntents.retrieve('pi_123', {
  expand: ['customer', 'latest_charge.balance_transaction'],
});

// paymentIntent.customer is now a full Customer object, not just an ID
if (typeof paymentIntent.customer !== 'string') {
  console.log(paymentIntent.customer?.name);
}
```

## Robust Webhook Handling
```typescript
import { headers } from 'next/headers';

export async function POST(req: Request) {
  const body = await req.text();
  const signature = headers().get('stripe-signature')!;

  try {
    const event = stripe.webhooks.constructEvent(
      body,
      signature,
      process.env.STRIPE_WEBHOOK_SECRET!
    );

    switch (event.type) {
      case 'checkout.session.completed':
        const session = event.data.object as Stripe.Checkout.Session;
        await fulfillOrder(session);
        break;
      // Handle other events
    }

    return new Response('ok', { status: 200 });
  } catch (err) {
    return new Response(`Webhook Error: ${err.message}`, { status: 400 });
  }
}
```

## Security & Best Practices
1. **Idempotency Keys**: Always use `idempotencyKey` for mutations to prevent double charging.
2. **Version Locking**: Explicitly set `apiVersion` to avoid breaking changes.
3. **Secret Rotation**: Use Stripe Managed secrets with regular rotation.

## The "Do Not" List
- **Do NOT** store raw card data on your servers (PCI Compliance).
- **Do NOT** use manual `has_more` loops for pagination; use the async iterator.
- **Do NOT** ignore webhook failures; implement a queue or dead-letter-office.
- **Do NOT** expose the secret key in any client-side code or browser-logs.

## Comparison: V12 vs V13
| Feature | V12 (Old) | V13 (Modern) |
| :--- | :--- | :--- |
| Pagination | Manual `starting_after` | `for await...of` |
| Expansion | String array (untyped) | Typed object paths |
| Typing | Partial Interfaces | Full Discriminated Unions |

## Complex Scenario: Tiered Subscriptions & Metered Billing
In v13+, managing complex billing models is significantly cleaner.

```typescript
async function createMeteredSubscription(customerId: string, priceId: string) {
  const subscription = await stripe.subscriptions.create({
    customer: customerId,
    items: [{ price: priceId }],
    payment_behavior: 'default_incomplete',
    payment_settings: { save_default_payment_method: 'on_subscription' },
    expand: ['latest_invoice.payment_intent'],
  });

  return subscription;
}

// Reporting usage for metered billing
async function reportUsage(subscriptionItemId: string, usage: number) {
  await stripe.subscriptionItems.createUsageRecord(
    subscriptionItemId,
    {
      quantity: usage,
      timestamp: Math.floor(Date.now() / 1000),
      action: 'set',
    }
  );
}
```

## Handling Post-Payment Actions with Webhooks
Use the metadata field to pass internal IDs through the Stripe lifecycle.

```typescript
const session = await stripe.checkout.sessions.create({
  success_url: 'https://example.com/success',
  line_items: [{ price: 'price_123', quantity: 1 }],
  mode: 'subscription',
  metadata: {
    userId: 'user_99',
    planLevel: 'pro_max',
  },
});
```

In the webhook:
```typescript
case 'checkout.session.completed':
  const session = event.data.object as Stripe.Checkout.Session;
  const { userId, planLevel } = session.metadata!;
  await db.users.update(userId, { tier: planLevel });
  break;
```

## Error Handling Pattern
```typescript
try {
  // Stripe action
} catch (err) {
  if (err instanceof Stripe.errors.StripeCardError) {
    // Show error to your customer
    console.log(err.message);
  } else if (err instanceof Stripe.errors.StripeRateLimitError) {
    // Too many requests made to the API too quickly
  } else {
    // General error
  }
}
```

*Updated: January 22, 2026 - 15:20*
