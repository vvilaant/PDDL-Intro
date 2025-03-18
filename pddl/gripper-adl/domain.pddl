(define (domain gripper-strips)
   (:requirements :adl)

   (:types ball room gripper - object)

   (:predicates
		(at-robby ?r - room)
		(at-ball ?b - ball ?r - room)
		(carry ?g - gripper ?b - ball))

   (:action move
       :parameters (?from - room ?to - room)
       :precondition (and  (at-robby ?from))
       :effect (and  (at-robby ?to) (not (at-robby ?from))))



   (:action pick
       :parameters (?ball - ball ?room - room ?gripper - gripper)
       :precondition  (and (at-ball ?ball ?room) (at-robby ?room) (forall (?b - ball) (and (not (carry ?gripper ?b)))))
       :effect (and (carry ?gripper ?ball)
		        (not (at-ball ?ball ?room))))


   (:action drop
       :parameters  (?ball - ball ?room - room ?gripper - gripper)
       :precondition  (and (carry ?gripper ?ball) (at-robby ?room))
       :effect (and (at-ball ?ball ?room)
                (forall (?b - ball) (and (not (carry ?gripper ?b))))
		        (not (carry ?gripper ?ball))))
)