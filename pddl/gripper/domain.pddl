(define (domain gripper-strips)
   (:predicates (room ?r)
		(ball ?b)
		(gripper ?g)
		(at-robby ?r)
		(at-ball ?b ?r)
		(free ?g)
		(carry ?g ?o))

   (:action move
       :parameters  (?from ?to)
       :precondition (and  (room ?from) (room ?to) (at-robby ?from))
       :effect (and  (at-robby ?to)
		     (not (at-robby ?from))))



   (:action pick
       :parameters (?obj ?room ?gripper)
       :precondition  (and  (ball ?obj) (room ?room) (gripper ?gripper)
			    (at-ball ?obj ?room) (at-robby ?room) (free ?gripper))
       :effect (and (carry ?gripper ?obj)
		    (not (at-ball ?obj ?room)) 
		    (not (free ?gripper))))


   (:action drop
       :parameters  (?obj  ?room ?gripper)
       :precondition  (and  (ball ?obj) (room ?room) (gripper ?gripper)
			    (carry ?gripper ?obj) (at-robby ?room))
       :effect (and (at-ball ?obj ?room)
		    (free ?gripper)
		    (not (carry ?gripper ?obj)))))
