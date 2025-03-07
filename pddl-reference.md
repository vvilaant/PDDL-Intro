# Writing Planning Domains and Problems in PDDL

PDDL contains STRIPS, ADL, and much more. Most planners, however, do not support full PDDL. The majority support only the STRIPS subset or some small extension of it. 

Most planners do not support all elements of (any version of) PDDL. Moreover, many planners have their own small "eccentricities", meaning that they may interpret certain PDDL constructs incorrectly or require minor variations in syntax that do not align with the official language specification. Some examples:

- Some planners have an implicit constraint that all arguments to an action must be distinct.
- Some planners require action preconditions and/or effects to be written as conjunctions (`(and ...)`), even when the precondition/effect contains only one atomic condition or no condition at all.
- Most planners ignore the `:requirements` part of the domain definition. However, some planners may fail to parse a domain definition if this part is missing or contains an unrecognized keyword.

A useful rule of thumb when writing PDDL is to always use the simplest constructs sufficient to express the problem. Additionally, always read the documentation for the planner you are using.

## What do we need for a PDDL Planning Task:
- **Objects**: Relevant elements for the problem at hand.
- **Predicates**: Properties of these objects and relations among them; (rule of thumb: a predicate applied to objects can be true or false).
- **Initial state**: The state of the world that we start in.
- **Goal specification**: Things that we want to be true.
- **Actions/Operators**: Ways of changing the state of the world.

### Where do we define these components:

Planning tasks specified in PDDL are separated into two files:
1. **Domain file** for predicates and actions.
2. **Problem file** for objects, initial state, and goal specification.


**Note:** Most planners require that these parts be in separate files, although PDDL itself does not enforce this.

### Comments in PDDL

- Comments in a PDDL file start with a semicolon (`;`) and extend to the end of the line.

### Requirements Declaration

Since PDDL is a general language and most planners support only a subset, domains may declare requirements. Common requirements include:

- `:strips` → Basic STRIPS subset.
- `:equality` → Uses the `=` predicate for equality.
- `:typing` → Uses type declarations.
- `:adl` → Uses ADL features (e.g., disjunctions, quantifiers, and conditional effects).

## Domain Definition

The domain definition contains predicates and operators (actions). It may also include types, constants, and static facts, but many planners do not support these features.

### **Example Domain Definition:**
```pddl
(define (domain DOMAIN_NAME)
  (:requirements [:strips] [:equality] [:typing] [:adl])
  (:predicates (PREDICATE_1_NAME ?A1 ?A2 ... ?AN)
               (PREDICATE_2_NAME ?A1 ?A2 ... ?AN))

  (:action ACTION_1_NAME
    [:parameters (?P1 ?P2 ... ?PN)]
    [:precondition PRECOND_FORMULA]
    [:effect EFFECT_FORMULA])

  (:action ACTION_2_NAME
    ...)
)
```

- Names (domain, predicate, action, etc.) typically use alphanumeric characters, hyphens (`-`), and underscores (`_`).
- Predicate and action parameters start with `?`.
- Predicate parameters specify the number of arguments but do not affect logic.

## What Do Predicates Mean?

Predicates in a domain definition **have no intrinsic meaning** beyond their name and parameter structure. Their interpretation depends on:
- **Effects of actions** in the domain.
- **Instances in the initial state** of the problem definition.

Some planners distinguish **static predicates** (unchanged by actions) and **dynamic predicates** (modified by actions).

## Action Definitions

Action definitions consist of:
- **Action Name**
- **Parameters** (optional)
- **Preconditions** (optional)
- **Effects** (optional, but essential for meaningful actions)

### **Precondition Formulas:**
```pddl
(and (PREDICATE_NAME ARG1 ... ARG_N))
```
If `:equality` is used:
```pddl
(= ARG1 ARG2)   ; Equality
(not (= ARG1 ARG2))  ; Negated equality
```

### **Effect Formulas:**
Effects in PDDL specify **changes to the world state**:
```pddl
(and (PREDICATE_NAME ARG1 ... ARG_N))  ; Add effects
(and (not (PREDICATE_NAME ARG1 ... ARG_N)))  ; Delete effects
```

For ADL domains:
```pddl
(when CONDITION_FORMULA EFFECT_FORMULA)  ; Conditional effect
(forall (?V1 ?V2 ...) EFFECT_FORMULA)  ; Universal effect
```

## Problem Definition

The problem definition includes objects, initial state, and goal.

### **Example Problem Definition:**
```pddl
(define (problem PROBLEM_NAME)
  (:domain DOMAIN_NAME)
  (:objects OBJ1 OBJ2 ... OBJ_N)
  (:init ATOM1 ATOM2 ... ATOM_N)
  (:goal CONDITION_FORMULA)
)
```

## Typing in PDDL

Typing allows defining **object categories**:
```pddl
(:types TYPE1 TYPE2 ...)
(:objects OBJ1 - TYPE1 OBJ2 - TYPE2)
```
If used, `:typing` must be declared in `:requirements`.
