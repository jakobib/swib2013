TITLE    = On the Way to a Holding Ontology
AUTHOR   = Carsten Klee; Jakob Voß
DATE     = SWIB2013, 2013-11-26
VERSION  = none
LANGUAGE = english
SOURCE   = slides.md

include vzgspec/Makefile

# TODO: simplify creation of slides - put into local.make?
TEX_TEMPLATE = ../vzgspec/templates/vzg-slides.latex
TEX_ARGS     = --slide-level 2 -t beamer --smart --standalone --number-sections --template $(TEX_TEMPLATE)
TEX_VARS     = -V documentclass=beamer
