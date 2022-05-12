(define
    (problem sairSala)
    (:domain agenteSeguranca)
    (:objects C1 S1 P1)
    (:init
        (Corredor C1)
        (Sala S1)
        (Porta P1)
        (Aberta P1)
        (Pertence P1 S1)
        (LocalSeguranca S1)
    )
    (:goal
        (and
            (LocalSeguranca C1)
        )
    ) ; Objetivo.
)
