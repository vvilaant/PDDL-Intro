
(define (domain hanoi)
  (:requirements :adl)
  (:predicates (clear ?x) (on ?x ?y) (smaller ?x ?y))

  (:action move
    :parameters (?disc ?from ?to)
    :precondition (and (smaller ?disc ?to) (on ?disc ?from) 
		                   (forall (?x) (not (on ?x ?disc)))
                       (forall (?x) (not (on ?x ?to))))
    :effect  (and  (on ?disc ?to) (not (on ?disc ?from))  
		  ))
  )
