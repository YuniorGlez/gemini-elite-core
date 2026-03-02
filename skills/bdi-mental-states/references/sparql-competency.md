# 🔍 SPARQL Competency Queries for BDI

Consultas para validar y extraer información del estado mental de los agentes.

## 1. Listar todas las Intenciones del Agente

```sparql
PREFIX bdi: <https://w3id.org/fossr/ontology/bdi/>
SELECT ?agent ?intention
WHERE {
  ?agent bdi:hasIntention ?intention .
}
```

## 2. Buscar Intenciones sin Deseo Soportado (Inconsistencias)

```sparql
PREFIX bdi: <https://w3id.org/fossr/ontology/bdi/>
SELECT ?agent ?intention
WHERE {
  ?agent bdi:hasIntention ?intention .
  FILTER NOT EXISTS { ?intention bdi:fulfils ?desire . }
}
```

## 3. Verificar si una Intención está soportada por Creencias actuales

```sparql
PREFIX bdi: <https://w3id.org/fossr/ontology/bdi/>
ASK WHERE {
  ?agent bdi:hasIntention ?intention ;
         bdi:hasBelief ?belief .
  ?intention bdi:isSupportedBy ?belief .
}
```

## 4. Obtener todos los Deseos de un Agente que aún no son Intenciones

```sparql
PREFIX bdi: <https://w3id.org/fossr/ontology/bdi/>
SELECT ?agent ?desire
WHERE {
  ?agent bdi:hasDesire ?desire .
  FILTER NOT EXISTS { ?intention bdi:fulfils ?desire . }
}
```
