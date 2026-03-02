# 🐢 BDI RDF Examples (Turtle)

Ejemplos prácticos de representación de estados mentales para agentes.

## 1. Escenario: Depuración de Código (Debugging)

```turtle
@prefix bdi: <https://w3id.org/fossr/ontology/bdi/> .
@prefix ex: <http://example.org/> .

ex:GeminiAgent a bdi:Agent ;
    bdi:hasBelief ex:ErrorInLine42 ;
    bdi:hasDesire ex:BugFixed ;
    bdi:hasIntention ex:ApplyFixAtLine42 .

ex:ApplyFixAtLine42 bdi:fulfils ex:BugFixed ;
    bdi:isSupportedBy ex:ErrorInLine42 .
```

## 2. Escenario: Navegación de Archivos (File Navigation)

```turtle
@prefix bdi: <https://w3id.org/fossr/ontology/bdi/> .
@prefix ex: <http://example.org/> .

ex:ExplorerAgent a bdi:Agent ;
    bdi:hasBelief ex:DirectoryListLoaded ;
    bdi:hasBelief ex:FilesFound ;
    bdi:hasDesire ex:TargetFileIdentified ;
    bdi:hasIntention ex:SearchForTargetFile .

ex:SearchForTargetFile bdi:fulfils ex:TargetFileIdentified ;
    bdi:isSupportedBy ex:DirectoryListLoaded .
```

## 3. Escenario: Multitasking (Consistencia)

```turtle
@prefix bdi: <https://w3id.org/fossr/ontology/bdi/> .
@prefix ex: <http://example.org/> .

ex:TaskAgent a bdi:Agent ;
    bdi:hasBelief ex:BusyProcessing ;
    bdi:hasDesire ex:AllTasksComplete ;
    bdi:hasIntention ex:PrioritizeCriticalTask .
```
