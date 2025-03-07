# Running Example: gripper Task with Four Balls

![robby](robby.png)
There is a robot that can move between two rooms and pick up or drop balls with either of his two arms, just one ball per hand at a time. Initially, all balls and the robot are in the first room. We want the balls to be in the second room.

## **Problem Description**
- **Objects**: Two rooms, four balls, two robot arms.
- **Predicates**:
  - `Is x a room?`
  - `Is x a ball?`
  - `Is ball x inside room y?`
  - `Is robot arm x empty?`
- **Initial State**: All balls and the robot are in the first room. All robot arms are empty.
- **Goal**: Move all balls to the second room.
- **Actions**: The robot can move, pick up, and drop a ball.

## **Objects**

```pddl
(:objects rooma roomb
          ball1 ball2 ball3 ball4
          left right)
```

## **Predicates**

```pddl
(:predicates (room ?x) (ball ?x) (gripper ?x)
             (at-robby ?x) (at-ball ?x ?y)
             (free ?x) (carry ?x ?y))
```

## **Initial State**

```pddl
(:init (room rooma) (room roomb)
       (ball ball1) (ball ball2) (ball ball3) (ball ball4)
       (gripper left) (gripper right)
       (free left) (free right)
       (at-robby rooma)
       (at-ball ball1 rooma) (at-ball ball2 rooma)
       (at-ball ball3 rooma) (at-ball ball4 rooma))
```

## **Goal**

```pddl
(:goal (and (at-ball ball1 roomb)
            (at-ball ball2 roomb)
            (at-ball ball3 roomb)
            (at-ball ball4 roomb)))
```

## Action Schemas

### **Movement**

- **Description**: The robot can move from `x` to `y`.
- **Precondition**: `room(x)`, `room(y)`, and `at-robby(x)` are true.
- **Effect**: `at-robby(y)` becomes true, `at-robby(x)` becomes false.

```pddl
(:action move
    :parameters (?x ?y)
    :precondition (and (room ?x) (room ?y) (at-robby ?x))
    :effect (and (at-robby ?y) (not (at-robby ?x))))
```

### **Pick-up**

- **Description**: The robot picks up `x` in `y` with `z`.
- **Precondition**: `ball(x)`, `room(y)`, `gripper(z)`, `at-ball(x, y)`, `at-robby(y)`, `free(z)` are true.
- **Effect**: `carry(z, x)` becomes true; `at-ball(x, y)` and `free(z)` become false.

```pddl
(:action pick-up
    :parameters (?x ?y ?z)
    :precondition (and (ball ?x) (room ?y) (gripper ?z)
                       (at-ball ?x ?y) (at-robby ?y) (free ?z))
    :effect (and (carry ?z ?x) (not (at-ball ?x ?y)) (not (free ?z))))
```

### **Drop**

- **Description**: The robot drops `x` in `y` from `z`.
- **Precondition**: Similar to `pick-up`, but `carry(z, x)` must be true.
- **Effect**: `at-ball(x, y)`, `free(z)` become true; `carry(z, x)` becomes false.

```pddl
(:action drop
    :parameters (?x ?y ?z)
    :precondition (and (ball ?x) (room ?y) (gripper ?z)
                       (carry ?z ?x) (at-robby ?y))
    :effect (and (at-ball ?x ?y) (free ?z) (not (carry ?z ?x))))
```

