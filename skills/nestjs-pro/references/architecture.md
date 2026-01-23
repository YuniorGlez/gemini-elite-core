# Enterprise Architecture (NestJS 2026)

Building scalable NestJS applications requires a commitment to clean architecture and modularity. In 2026, the standard is a "Hexagonal" or "Onion" approach.

## 1. Feature-First Modularity
Stop organizing by technical layers (controllers/, services/). Organize by BUSINESS DOMAIN.

### Example Directory Structure
```
src/
  iam/                # Identity & Access Management
    authentication/
    authorization/
    iam.module.ts
  users/              # Users Feature
    application/      # Services & Use Cases
    domain/           # Entities & Repositories
    infrastructure/   # Controllers & Persistence
    users.module.ts
  app.module.ts
```

## 2. The Repository Pattern
Decouple your business logic from your ORM (Prisma/TypeORM).

```typescript
// domain/users.repository.ts
export interface UsersRepository {
  findById(id: string): Promise<User | null>;
  save(user: User): Promise<void>;
}

// infrastructure/prisma-users.repository.ts
@Injectable()
export class PrismaUsersRepository implements UsersRepository {
  constructor(private prisma: PrismaService) {}
  // implementation...
}
```

## 3. CQRS (Command Query Responsibility Segregation)
For complex state changes, use the `@nestjs/cqrs` package. This separates the logic for "writing" (Commands) from "reading" (Queries), allowing independent scaling and simpler code.

---
*Updated: January 23, 2026*
