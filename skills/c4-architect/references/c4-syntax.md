# C4 Syntax Reference (Mermaid.js)

## 1. Context Elements
- `Person(alias, label, [description])`: Internal human user.
- `Person_Ext(alias, label, [description])`: External human user.
- `System(alias, label, [description])`: Internal software system.
- `System_Ext(alias, label, [description])`: External software system.
- `SystemDb(alias, label, [description])`: Internal database.

---

## 2. Container Elements
- `Container(alias, label, technology, [description])`: Application, service, or script.
- `ContainerDb(alias, label, technology, [description])`: Database or data store.
- `ContainerQueue(alias, label, technology, [description])`: Message queue or bus.

---

## 3. Component Elements
- `Component(alias, label, technology, [description])`: A module or library within a container.

---

## 4. Boundaries & Layout
- `Enterprise_Boundary(alias, label) { ... }`: Grouping for an organization.
- `System_Boundary(alias, label) { ... }`: Grouping for a specific system's containers.
- `Container_Boundary(alias, label) { ... }`: Grouping for a container's components.
- `UpdateLayoutConfig($c4ShapeInRow="3", $c4BoundaryInRow="1")`: Controls the grid layout.

---

## 5. Relationships
- `Rel(from, to, label, [technology])`: Standard relationship.
- `BiRel(from, to, label, [technology])`: Bidirectional relationship.
- `Rel_Back(from, to, label, [technology])`: Reverse arrow.
- `Rel_Neighbor(from, to, label, [technology])`: Hints for horizontal layout.

---

## 6. Styling
- `UpdateElementStyle(alias, $bgColor="color", $fontColor="color", $borderColor="color")`.
- `UpdateRelStyle(from, to, $textColor="color", $lineColor="color")`.
