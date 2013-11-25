## Another RDF Encoding Form?

**aREF** = JSON-LD *light* + Turtle *light*

* Based on maps, strings, and arrays like JSON 

* Easy literals like Turtle:\
  `"literal@language-tag"`\
  `"literal^data:type"`

## What's wrong with existing serializations?

* RDF/XML is awful
* RDF/JSON is too verbose
* Turtle is one big string (parsing required)
* JSON-LD is complex (13 keywords *WTF?!*)

None of them are good for writing RDF data right in your code.

## Purpose of aREF

Read and write RDF data in any code or data structures\
(JSON, YAML, INI files, Perl code, Ruby, Phython....)

                                           aREF
    Serialization <--> List-Map-Structures <==> RDF Triples
     (e.g. YAML)         (data structure)
     
## Example 1: Serialization in YAML

    _id:        http://example.com/people#john
    foaf:name:  John Smith
    foaf:age:   41^xsd:integer
    foaf:homepage: 
        - _id: http://personal.example.org/
          dct:modified: 2010-05-29^xsd:date
        - http://work.example.com/jsmith/
    dct:description: a nice guy@en
    foaf:knows: 
        foaf:name: Alice

## Example 2: Serialization in Perl-Code

    $rdf = {
      _id       => 'http://example.com/people#john',
      foaf_name => 'John Smith',
      foaf_age  => '41^xsd:integer',
      foaf_homepage => [
         { 
           _id => 'http://personal.example.org/',
           dct_modified => '2010-05-29^xsd:date',
         },
        'http://work.example.com/jsmith/',
      ],
      dct_description => 'a nice guy@en',
      foaf_knows => { foaf_name => "Alice" },
    };

## Getting started

* Current specification and issue tracker
  <http://gbv.github.io/aREF/>

* Preliminary implementation in Perl:
  <https://metacpan.org/release/Catmandu-RDF>

*Feedback welcome!*

