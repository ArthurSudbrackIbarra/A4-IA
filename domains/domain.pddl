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
    (:action abrirPorta  :parameters (?loc ?sala ?porta)
                    :precondition (and (LocalSeguranca ?loc) (Corredor ?loc) (Sala ?sala) (Porta ?porta) (Pertence ?porta ?sala) (not (Aberta ?porta)))
                    :effect (Aberta ?porta)
    )
    ; [Ação - Fechar uma porta]
    (:action fecharPorta  :parameters (?loc ?sala ?porta)
                    :precondition (and (LocalSeguranca ?loc) (Corredor ?loc) (Sala ?sala) (Porta ?porta) (Pertence ?porta ?sala) (Aberta ?porta))
                    :effect (not (Aberta ?porta))
    )

    ; [Ação - Entrar em uma sala]
    (:action entrar  :parameters (?loc ?sala ?porta)
                    :precondition (and (LocalSeguranca ?loc) (Corredor ?loc) (Sala ?sala) (Porta ?porta) (Pertence ?porta ?sala) (Aberta ?porta))
                    :effect (and (LocalSeguranca ?sala) (not (LocalSeguranca ?loc)))
    )
    ; [Ação - Sair de uma sala]
    (:action sair  :parameters (?loc ?corr ?porta)
                    :precondition (and (LocalSeguranca ?loc) (Corredor ?corr) (Sala ?loc) (Porta ?porta) (Pertence ?porta ?loc) (Aberta ?porta))
                    :effect (and (LocalSeguranca ?corr) (not (LocalSeguranca ?loc)))
    )
    
    ; [Ação - Ligar uma luz]
    (:action ligarLuz  :parameters (?loc ?luz)
                    :precondition (and (LocalSeguranca ?loc) (Sala ?loc) (Luz ?luz) (Pertence ?luz ?loc) (not (Ligada ?luz)))
                    :effect (Ligada ?luz)
    )
    ; [Ação - Desligar uma luz]
    (:action desligarLuz  :parameters (?loc ?luz)
                    :precondition (and (LocalSeguranca ?loc) (Sala ?loc) (Luz ?luz) (Pertence ?luz ?loc) (Ligada ?luz))
                    :effect (not (Ligada ?luz))
    )
    
    ; [Ação - Abrir uma janela]
    (:action abrirJanela  :parameters (?loc ?jan)
                    :precondition (and (LocalSeguranca ?loc) (Sala ?loc) (Janela ?jan) (Pertence ?jan ?loc) (not (Aberta ?jan)))
                    :effect (Aberta ?jan)
    )
    ; [Ação - Fechar uma janela]
    (:action fecharJanela  :parameters (?loc ?luz ?jan)
                    :precondition (and (LocalSeguranca ?loc) (Sala ?loc) (Luz ?luz) (Ligada ?luz) (Pertence ?luz ?loc) (Janela ?jan) (Pertence ?jan ?loc) (Aberta ?jan))
                    :effect (not (Aberta ?jan))
    )
    
)
