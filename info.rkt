#lang setup/infotab

(define name "CRC CCITT checksum generator.")
(define release-notes
  (list '(ul (li "Initial release"))))

(define repositories
  (list "4.x"))
(define blurb
  (list "look up table based CRC computation using the non-reversed CCITT_CRC polynomial 0x1021 (truncated)"))

(define scribblings '(("crc.scrbl" ())))
(define primary-file "main.rkt")
(define categories '(scientific net))