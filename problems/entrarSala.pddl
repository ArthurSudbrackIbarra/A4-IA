(define
    (problem entrarSala)
    (:domain agenteSeguranca)
    (:objects C1 S1 P1)
    (:init
        (Corredor C1) ; Corredor.
        (Sala S1) ; Sala 1.
        (Porta P1) ; Porta 1.
        (not (Aberta P1)) ; Porta 1 não está aberta
        (Pertence P1 S1) ; Porta 1 pertence à sala 1.
        (LocalSeguranca C1) ; Segurança está no corredor.
    )
    (:goal ; Objetivo.
        (and
            (LocalSeguranca S1)
        )
    ) 
)
