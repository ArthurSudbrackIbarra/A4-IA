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
    ; [Ação - Sair de uma sala]
    (:action sair  :parameters (?loc ?corr ?porta)
                    :precondition (and (LocalSeguranca ?loc) (Corredor ?corr) (Sala ?loc) (Pertence ?porta ?loc) (Aberta ?porta))
                    :effect (and (LocalSeguranca ?corr) (not (LocalSeguranca ?loc)))
    )
    
)
