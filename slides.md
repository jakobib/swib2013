## Holding ontology

Main purpose of a (holding) ontology:

* *clarify confusion by agreement on concepts*

Confusion about terms such as
 
* "holding"
* "document"
* "copy"
* "item"
* "piece"
* "copy"
* ...?

## What kind of holding data?

1. What holdings does a library have?
2. What documents are included in or exemplified by a holding?
3. What can patrons do with a holding?
4. Where is a holding located?
5. What are unique properties of a holding?
6. What is a patron doing with a holding?

## Core Concepts (1/2)

Why create new RDF classes? Reuse existing ones!

**frbr:Item**
  : an exemplar/copy of a document (aka "holding")

**bibo:Document = foaf:Document**
  : an abstract or concrete work
    which an frbr:Item is exemplar of

**foaf:Agent**
  : a person or organization (a library, a patron...)

**schema:Place = gr:Location**
  : a place or location\
    (a library building, a floor, a stack...)

## Core Concepts (2/2)

Why put everything in one ontology? Create micro-ontologies!

**dso:DocumentService**
  : a service that includes a document (lending, accessing, copying...)

**ssso:ServiceEvent**
  : a service that is also an event 
    (e.g. the lending of item X by patron Y during time Z)

**ecpo:Chronology**
  : enumerations and chronology of a periodical or series

Here "a service that" refers to **service:Service** defined in the Service
Ontology to describe services both abstract and as event.

## Micro-Ontologies (classes/properties/individuals)

* **Service Ontology** (4/8/0)\
  <http://dini-ag-kim.github.io/service-ontology/>

* **Document Service Ontology (DSO)** (5/2/0)\
  <http://purl.org/ontology/dso>

* **Simple Service Status Ontology (SSSO)** (8/2/0)\
  <http://purl.org/ontology/ssso>

* **Holding Ontology** (0/10/0)\
  <http://dini-ag-kim.github.io/holding-ontology/>

* **Enumeration and Chronology of Periodicals Ontology (ECPO)** (3/29/2)
  <http://purl.org/ontology/ecpo>

* **DAIA Ontology (DAIA)** (0/4/0)\
  <http://gbv.github.io/daiaspec>

* **PAIA Ontology (PAIA)** (2/1/2)\
  <http://purl.org/ontology/paia>

## What kind of holding data? (1/2)

1. **What holdings does a library have?**

    * `$library a foaf:Agent ;`\
      `    holding:holds [ a frbr:Item ] .`\

    *  *This does not imply services (see 3.)!*

2. **What documents are included/exemplified by a holding?**

    * `$holding a frbr:Item;`\
      `holding:exemplar [ a bibo:Document ] .`\
    * `$holding a frbr:Item;`\
      `ecpo:hasChronolgy [ a ecpo:Chronology ].`
    * Part/whole relationships:\
      `dcterms:hasPart`, `holding:narrowerExemplar`...

3. **What can patrons do with a holding?**

    Services and Offerings that include holding items\
    (`daia:availableFor`, `service:providedBy`...)

## What kind of holding data? (1/2)

4. **Where is a holding located?**

    * `$holding a frbr:Item ;`\
      `schema:location $place ;`\
      `holding:inCollection $col .`
    * `$o a schema:Offer ;`\
      `   gr:includesObject $holding ;`\
      `   schema:availableAtOrFrom $place .`\
    * ...?

5. **What are unique properties of a holding?**

    `holding:label` (aka call number, shelf mark...)

6. **What is a patron doing with a holding?**

     holdings currently on loan or reserved expressible with\
     PAIA ontology and Simple Service Status Ontology.

## Summary

The holding ontology combines 

* existing ontologies (BibO, FOAF, GoodRelations, Schema.org)
* new micro-ontologies (DSO, SSSO, ECPO, DAIA, Service)
* and a couple of holding ontology properties 

to all RDF terms required to describe holding information.

*work in progress, feedback welcome!*

<https://github.com/dini-ag-kim/holding-ontology>
