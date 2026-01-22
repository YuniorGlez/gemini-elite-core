# Reference: Advanced Forms & Tables (Filament 2026)

## Overview
Filament v4 is more than a database viewer. This reference covers complex data orchestration.

---

## 📝 1. Advanced Form Patterns

### The "Wizard" Pattern
For multi-step processes with complex validation.
```php
Forms\Components\Wizard::make([
    Forms\Components\Wizard\Step::make('Basic Info')
        ->schema([ ... ]),
    Forms\Components\Wizard\Step::make('Review')
        ->schema([ ... ]),
])->submitAction(new HtmlString('<button type="submit">Complete</button>'))
```

### Conditional Schemas
Using `visible()`, `hidden()`, and `required()` with closures for dynamic forms.
```php
TextInput::make('vat_number')
    ->visible(fn (Get $get) => $get('is_business'))
    ->required(fn (Get $get) => $get('is_business'))
```

---

## 📊 2. High-Performance Tables

### Custom Data Sources
How to wrap a 3rd party API in a "Table-Compatible" way.

```php
public function getTableQuery(): Builder
{
    // Return a 'Dummy' builder or use a specialized API builder
    return MyApiService::query(); 
}
```

### Table Actions
Use `ActionGroup` to keep the UI clean when you have 5+ actions per row.
```php
Tables\Actions\ActionGroup::make([
    Tables\Actions\EditAction::make(),
    Tables\Actions\DeleteAction::make(),
    Tables\Actions\Action::make('archive'),
])
```

---

## 🧩 3. Custom Form Components
When the built-in fields aren't enough, build your own using Blade and Alpine.

1.  **Create the class:** `php artisan make:form-component SpecialInput`
2.  **Define the view:** `resources/views/filament/forms/components/special-input.blade.php`
3.  **Implement `state` binding:** Use `x-model="state"` in Alpine to sync with Livewire.
