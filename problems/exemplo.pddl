(define
    (problem exemplo)
    (:domain agenteSeguranca)
    (:objects C1 S1 S2 S3 S4 P1 P2 P3 P4 L1 L2 L3 L4 J1 J2 J3 J4)
    (:init
        (Corredor C1)
        (Sala S1)
        (Sala S2)
        (Sala S3)
        (Sala S4)
        (Porta P1)
        (Porta P2)
        (Porta P3)
        (Porta P4)
        (Aberta P1)
        (Aberta P2)
        (Aberta P3)
        (Aberta P4)
        (Pertence P1 S1)
        (Pertence P2 S2)
        (Pertence P3 S3)
        (Pertence P4 S4)
        (Luz L1)
        (Luz L2)
        (Luz L3)
        (Luz L4)
        (Ligada L1)
        (Ligada L2)
        (Ligada L3)
        (Ligada L4)
        (Pertence L1 S1)
        (Pertence L2 S2)
        (Pertence L3 S3)
        (Pertence L4 S4)
        (Janela J1)
        (Janela J2)
        (Janela J3)
        (Janela J4)
        (Aberta J1)
        (Aberta J2)
        (Aberta J3)
        (Aberta J4)
        (Pertence J1 S1)
        (Pertence J2 S2)
        (Pertence J3 S3)
        (Pertence J4 S4)
        (LocalSeguranca C1)
    )
    (:goal
        (and
            (not (Ligada L1))
            (not (Aberta P1))
            (not (Aberta J1))
            (not (Ligada L2))
            (not (Aberta P2))
            (not (Aberta J2))
            (not (Ligada L3))
            (not (Aberta P3))
            (not (Aberta J3))
            (not (Ligada L4))
            (not (Aberta P4))
            (not (Aberta J4))
        )
    )
)
