#lang racket

(require "../src/crc.rkt" rackunit rackunit/text-ui)


(define-test-suite crc-ccitt-16-suite
  (check-equal? (crc-ccitt-checksum #"123456789")
                #x29b1)

  (check-equal? (crc-ccitt-checksum #"ABC")
                #xf508)

  (check-equal? (crc-ccitt-checksum (bytes #x24 #x24 #x00 #x11 #x13 #x61
                                           #x23 #x45 #x67 #x8f #xff #x50 #x00))
                #x000005d8))

(run-tests crc-ccitt-16-suite)

