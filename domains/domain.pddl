(define (domain agenteSeguranca)
    (:requirements
        :strips
        :quantified-preconditions
    )
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
    (:action abrir_porta  :parameters (?loc ?sala ?porta)
                    :precondition (and
                        (LocalSeguranca ?loc)
                        (Corredor ?loc) (Sala ?sala)
                        (Porta ?porta)
                        (Pertence ?porta ?sala)
                        (not (Aberta ?porta))
                        (forall (?x - Porta)
                            (not (Aberta ?x))
                        )
                    )
                    :effect (Aberta ?porta)
    )

    ; [Ação - Entrar em uma sala]
    (:action entrar  :parameters (?loc ?sala ?porta)
                    :precondition (and
                        (LocalSeguranca ?loc)
                        (Corredor ?loc)
                        (Sala ?sala)
                        (Porta ?porta)
                        (Pertence ?porta ?sala)
                        (Aberta ?porta)
                    )
                    :effect (and (LocalSeguranca ?sala) (not (LocalSeguranca ?loc)))
    )
    ; [Ação - Sair de uma sala e fechar a porta]
    (:action sair_e_fechar  :parameters (?loc ?corr ?porta ?luz)
                    :precondition (and
                        (LocalSeguranca ?loc)
                        (Corredor ?corr)
                        (Sala ?loc)
                        (Porta ?porta)
                        (Pertence ?porta ?loc)
                        (Aberta ?porta)
                        (Luz ?luz)
                        (not (Ligada ?luz))
                        (Pertence ?luz ?loc)
                    )
                    :effect (and (LocalSeguranca ?corr) (not (LocalSeguranca ?loc)) (not (Aberta ?porta)))
    )
    
    ; [Ação - Ligar uma luz]
    (:action ligar_luz  :parameters (?loc ?luz)
                    :precondition (and
                        (LocalSeguranca ?loc)
                        (Sala ?loc)
                        (Luz ?luz)
                        (Pertence ?luz ?loc)
                        (not (Ligada ?luz))
                    )
                    :effect (Ligada ?luz)
    )
    ; [Ação - Desligar uma luz]
    (:action desligar_luz  :parameters (?loc ?luz)
                    :precondition (and
                        (LocalSeguranca ?loc)
                        (Sala ?loc) (Luz ?luz)
                        (Pertence ?luz ?loc)
                        (Ligada ?luz)
                    )
                    :effect (not (Ligada ?luz))
    )
    
    ; [Ação - Abrir uma janela]
    (:action abrir_janela  :parameters (?loc ?jan)
                    :precondition (and
                        (LocalSeguranca ?loc)
                        (Sala ?loc)
                        (Janela ?jan)
                        (Pertence ?jan ?loc)
                        (not (Aberta ?jan))
                    )
                    :effect (Aberta ?jan)
    )
    ; [Ação - Fechar uma janela]
    (:action fechar_janela  :parameters (?loc ?luz ?jan)
                    :precondition (and
                        (LocalSeguranca ?loc)
                        (Sala ?loc)
                        (Luz ?luz)
                        (Ligada ?luz)
                        (Pertence ?luz ?loc)
                        (Janela ?jan)
                        (Pertence ?jan ?loc)
                        (Aberta ?jan)
                    )
                    :effect (not (Aberta ?jan))
    )
    
)
