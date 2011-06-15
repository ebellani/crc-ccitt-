;; Based on the crcccitt C lib by Jack Klein [1] . As such this follows the
;; same license as his lib.

;;  Copyright (C) 2000  Eduardo Bellani


;;  This program is free software; you can redistribute it
;;  and/or modify it under the terms of the GNU General
;;  Public License as published by the Free Software
;;  Foundation; either version 2 of the License, or
;;  (at your option) any later version.

;;  This program is distributed in the hope that it will
;;  be useful, but WITHOUT ANY WARRANTY; without even the
;;  implied warranty of MERCHANTABILITY or FITNESS FOR A
;;  PARTICULAR PURPOSE.  See the GNU General Public License
;;  for more details.

;;  You should have received a copy of the GNU General
;;  Public License along with this program; if not, write
;;  to the Free Software Foundation, Inc., 675 Mass Ave,
;;  Cambridge, MA 02139, USA.

;;  Jack Klein may be contacted by email at:
;;     The_C_Guru@yahoo.com

;;  Eduardo Bellani can be contacted by email at:
;;     ebellani@gmail.com

;; [1] http://jk-technology.com/C_Unleashed/crcccitt.c

#lang racket

(provide/contract [crc-ccitt-checksum (bytes? . -> . (integer-in 0 #xffff))])

(define crc-table
  #( #x0000 #x1021 #x2042 #x3063 #x4084 #x50a5
     #x60c6 #x70e7 #x8108 #x9129 #xa14a #xb16b
     #xc18c #xd1ad #xe1ce #xf1ef #x1231 #x0210
     #x3273 #x2252 #x52b5 #x4294 #x72f7 #x62d6
     #x9339 #x8318 #xb37b #xa35a #xd3bd #xc39c
     #xf3ff #xe3de #x2462 #x3443 #x0420 #x1401
     #x64e6 #x74c7 #x44a4 #x5485 #xa56a #xb54b
     #x8528 #x9509 #xe5ee #xf5cf #xc5ac #xd58d
     #x3653 #x2672 #x1611 #x0630 #x76d7 #x66f6
     #x5695 #x46b4 #xb75b #xa77a #x9719 #x8738
     #xf7df #xe7fe #xd79d #xc7bc #x48c4 #x58e5
     #x6886 #x78a7 #x0840 #x1861 #x2802 #x3823
     #xc9cc #xd9ed #xe98e #xf9af #x8948 #x9969
     #xa90a #xb92b #x5af5 #x4ad4 #x7ab7 #x6a96
     #x1a71 #x0a50 #x3a33 #x2a12 #xdbfd #xcbdc
     #xfbbf #xeb9e #x9b79 #x8b58 #xbb3b #xab1a
     #x6ca6 #x7c87 #x4ce4 #x5cc5 #x2c22 #x3c03
     #x0c60 #x1c41 #xedae #xfd8f #xcdec #xddcd
     #xad2a #xbd0b #x8d68 #x9d49 #x7e97 #x6eb6
     #x5ed5 #x4ef4 #x3e13 #x2e32 #x1e51 #x0e70
     #xff9f #xefbe #xdfdd #xcffc #xbf1b #xaf3a
     #x9f59 #x8f78 #x9188 #x81a9 #xb1ca #xa1eb
     #xd10c #xc12d #xf14e #xe16f #x1080 #x00a1
     #x30c2 #x20e3 #x5004 #x4025 #x7046 #x6067
     #x83b9 #x9398 #xa3fb #xb3da #xc33d #xd31c
     #xe37f #xf35e #x02b1 #x1290 #x22f3 #x32d2
     #x4235 #x5214 #x6277 #x7256 #xb5ea #xa5cb
     #x95a8 #x8589 #xf56e #xe54f #xd52c #xc50d
     #x34e2 #x24c3 #x14a0 #x0481 #x7466 #x6447
     #x5424 #x4405 #xa7db #xb7fa #x8799 #x97b8
     #xe75f #xf77e #xc71d #xd73c #x26d3 #x36f2
     #x0691 #x16b0 #x6657 #x7676 #x4615 #x5634
     #xd94c #xc96d #xf90e #xe92f #x99c8 #x89e9
     #xb98a #xa9ab #x5844 #x4865 #x7806 #x6827
     #x18c0 #x08e1 #x3882 #x28a3 #xcb7d #xdb5c
     #xeb3f #xfb1e #x8bf9 #x9bd8 #xabbb #xbb9a
     #x4a75 #x5a54 #x6a37 #x7a16 #x0af1 #x1ad0
     #x2ab3 #x3a92 #xfd2e #xed0f #xdd6c #xcd4d
     #xbdaa #xad8b #x9de8 #x8dc9 #x7c26 #x6c07
     #x5c64 #x4c45 #x3ca2 #x2c83 #x1ce0 #x0cc1
     #xef1f #xff3e #xcf5d #xdf7c #xaf9b #xbfba
     #x8fd9 #x9ff8 #x6e17 #x7e36 #x4e55 #x5e74
     #x2e93 #x3eb2 #x0ed1 #x1ef0))

(define (crc-ccitt-checksum data)
  (bitwise-bit-field 
   (for/fold ([crc #xffff])
       ([datum (in-bytes data)])
     (bitwise-xor
      (arithmetic-shift crc 8)
      (vector-ref crc-table
                  (bitwise-and (bitwise-xor datum
                                            (arithmetic-shift crc -8))
                               #xff))))
   0 16))
