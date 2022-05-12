(define (problem problema2)
    (:domain agenteSeguranca)
    (:objects C1 S1 P1 L1)
    (:init (Corredor C1)
           (Sala S1)
           (Porta P1)
           (not (Aberta P1))
           (Pertence P1 S1)
           (Luz L1)
           (not (Ligada L1))
           (Pertence L1 S1)
           (LocalSeguranca C1)
    )
    (:goal  (and (Ligada L1))) ; Objetivo.
)
