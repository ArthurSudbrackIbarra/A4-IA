(define
    (problem fecharJanela)
    (:domain agenteSeguranca)
    (:objects C1 S1 P1 L1 J1)
    (:init
        (Corredor C1)
        (Sala S1)
        (Porta P1)
        (not (Aberta P1))
        (Pertence P1 S1)
        (Luz L1)
        (not (Ligada L1))
        (Pertence L1 S1)
        (Janela J1)
        (Aberta J1)
        (Pertence J1 S1)
        (LocalSeguranca C1)
    )
    (:goal
        (and
            (not (Ligada L1))
            (not (Aberta J1))
        )
    )
)
