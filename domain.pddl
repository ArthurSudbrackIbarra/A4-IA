(define (domain agenteSeguranca)
    (:requirements :strips)
    (:predicates  (Janela ?jan) 
                  (Porta ?porta) 
                  (Aberta ?porta)
                  (Luz ?luz) 
                  (Ligada ?luz)
                  (Sala ?sala)
                  (Pertence ?obj ?sala)
                  (Corredor ?corr)
                  (LocalSeguranca ?loc)
    )
    
    ; [Ação - Abrir uma porta]
    (:action abrir  :parameters (?loc ?sala ?porta)
                    :precondition (and (LocalSeguranca ?loc) (Corredor ?loc) (Sala ?sala) (Pertence ?porta ?sala) (not (Aberta ?porta)))
                    :effect (Aberta ?porta)
    )
    ; [Ação - Fechar uma porta]
    (:action fechar  :parameters (?loc ?sala ?porta)
                    :precondition (and (LocalSeguranca ?loc) (Corredor ?loc) (Sala ?sala) (Pertence ?porta ?sala) (Aberta ?porta))
                    :effect (not (Aberta ?porta))
    )

    ; [Ação - Entrar em uma sala]
    (:action entrar  :parameters (?loc ?sala ?porta)
                    :precondition (and (LocalSeguranca ?loc) (Corredor ?loc) (Sala ?sala) (Pertence ?porta ?sala) (Aberta ?porta))
                    :effect (and (LocalSeguranca ?sala) (not (LocalSeguranca ?loc)))
    )
    
)
