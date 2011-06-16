#lang scribble/doc
@(require scribble/manual
          scribble/basic
          scribble/extract)

@title[#:tag "top"]{CRC CCITT}
@author[(author+email "Eduardo Bellani" "ebellani@gmail.com")]

This package is obtaining the @link["http://en.wikipedia.org/wiki/Cyclic_redundancy_check"]{CRC CCITT} for some vector of bytes.

Basically it mirrors Jack Klein's library that can be found 
 @link["http://jk-technology.com/C_Unleashed/crcccitt.c"]{here}.
 
For now there is only one version with the initial element being 0xFFFF.

@local-table-of-contents[]

@section[#:tag "api"]{API}

@include-extracted[(file "src/crc.rkt")]
