# Holding ontology

* What's a holding, copy, item, piece, copy ...?
* There is a lot of confusion!

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

docso:DocumenService
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

# Some open questions

* Can we just use `frbr:Item` without implying the unwanted rest of FRBR?

* Is the library service of lending a `schema:Product`, 
  (even if it is not sold for money)?

* ...

