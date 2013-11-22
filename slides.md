# Holding ontology

* What's a holding, document copy, item, piece, copy ...?
* Main purpose of holding ontology: 
  clarify confusion.

# What kind of holding data?

1. What holdings does a library have?
2. What documents are included in or exemplified by a holding?
3. Where is a holding located?
4. What are unique properties of a holding?
5. What can patrons do with a holding?
6. What is a patron doing with a holding?

# Core Concepts (1/2)

Why create new RDF Classes if one can reuse existing ones?

frbr:Item
  : an exemplar/copy of a document (aka *"holding"*)

bibo:Document = foaf:Document
  : an abstract or concrete work (≈ **schema:CreativeWork**),
    which an *frbr:Item* is exemplar of.

foaf:Agent
  : a person or organization (a library, a patron...)

schema:Place = gr:Location
  : a place or location (a library building, a floor, a stack...)

# Core Concepts (2/2)

Why put everything in one ontology if micro-ontologies can better be reused?

dso:DocumentService
  : a service that includes a document (lending, accessing, copying...)

ssso:ServiceEvent
  : a service that is also an event 
    (e.g. the lending of item X by patron Y during time Z)

ecpo:Chronology
  : enumerations and chronology of a periodical or series

Here "a service that" refers to **service:Service**, defined to describe
services both abstract and as event.

# ...

1. What holdings does a library have?

   `frbr:Item <--- holding:heldBy / holding:holds ---> foaf:Agent`

2. What documents are included in or exemplified by a holding?

   `frbr:Item --- holding:exemplar ----> bibo:Document`

   `frbr:Item --- ecpo:hasChronolgy ---> ecpo:Chronology`

   `dcterms:hasPart`, `holding:narrowerExemplar`, `holding:broaderExemplar`

3. Where is a holding located?

   `frbr:Item` --- holding:inCollection ---> ???`

4. What are unique properties of a holding?

    `holding:label` (aka call number, shelf mark...)

5. What can patrons do with a holding?

    TODO: Services and Offerings... 
    (availableFor, providedBy...)

6. What is a patron doing with a holding?

    `ssso:ServiceEvent`

# Accompanied APIs

* DAIA: availability (for loan, for local view, open access...)
* PAIA: patron account (holdings currently on loan or reserved)

Should both be mapped to holding ontology.

# Summary

The holding ontology combines existing ontologies (Bibo, FOAF, GoodRelations,
Schema.org), new micro-ontologies (DOCSO, SSSO, ECPO, Service), and a couple of
properties to all RDF terms required to describe holding information.

# Micro-Ontologies

Service Ontology
  : <http://dini-ag-kim.github.io/service-ontology/>\
    (4 classes, 8 properties)

Document Service Ontology (DSO)
  : <http://purl.org/ontology/dso>\
    (5 classes, 2 properties)

Simple Service Status Ontology (SSSO)
  : <http://purl.org/ontology/ssso>\
    (8 classes, 2 properties)

Holding Ontology
  : <http://dini-ag-kim.github.io/holding-ontology/>\
    (10 properties)

Enumeration and Chronology of Periodicals Ontology (ECPO)
  : <http://purl.org/ontology/ecpo>\
    (3 classes, 29 properties, 2 individuals)

DAIA Ontology (DAIA):
  : <http://gbv.github.io/daiaspec>\
    (4 properties)

PAIA Ontology (PAIA)
  : <http://purl.org/ontology/paia>\
    (2 classes, 1 property, 2 individuals)

