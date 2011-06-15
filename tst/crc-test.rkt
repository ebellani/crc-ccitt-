#lang racket

(require "../src/crc.rkt" rackunit rackunit/text-ui)


(define-test-suite crc-ccitt-16-suite
  (check-equal? (crc-ccitt-checksum #"123456789")
                #x29b1)

  (check-equal? (crc-ccitt-checksum #"ABC")
                #xf508))

(run-tests crc-ccitt-16-suite)

