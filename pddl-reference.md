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

### Precondition Formulas

In a STRIPS domain, a precondition formula may be:
* An atomic formula: `(PREDICATE_NAME ARG1 ... ARG_N)` The predicate arguments must be parameters of the action (or constants declared in the domain, if the domain has constants).
* A conjunction of atomic formulas: `(and ATOM1 ... ATOM_N)`

If the domain uses `:equality`, an atomic formula may also be of the form `(= ARG1 ARG2)`. Many planners that support equality also allow negated equality, which is written `(not (= ARG1 ARG2))`, even if they do not allow negation in any other part of the definition.

In an ADL domain, a precondition may in addition be:
* A general negation, conjunction or disjunction: 
  * `(not CONDITION_FORMULA)`
  * `(and CONDITION_FORMULA1 ... CONDITION_FORMULA_N)`
  * `(or CONDITION_FORMULA1 ... CONDITION_FORMULA_N)`
* A quantified formula:
  * `(forall (?V1 ?V2 ...) CONDITION_FORMULA)`
  * `(exists (?V1 ?V2 ...) CONDITION_FORMULA)`

### Effect Formulas

In PDDL, the effects of an action are not explicitly divided into "adds" and "deletes". Instead, negative effects (deletes) are denoted by negation.

In a STRIPS domain, an effect formula may consist of:
* An added atom: `(PREDICATE_NAME ARG1 ... ARG_N)` The predicate arguments must be parameters of the action (or constants declared in the domain, if the domain has constants).
* A deleted atom: `(not (PREDICATE_NAME ARG1 ... ARG_N))`
* A conjunction of atomic effects: `(and ATOM1 ... ATOM_N)`

The equality predicate `(=)` can of course not occur in an effect formula: no action can make two identical things be not identical!

In an ADL domain, an effect formula may in addition contain:
* A conditional effect: `(when CONDITION_FORMULA EFFECT_FORMULA)` The interpretation is that the specified effect takes place only if the specified condition formula is true in the state where the action is executed. Conditional effects are usually placed within quantifiers.
* A universally quantified formula: `(forall (?V1 ?V2 ...) EFFECT_FORMULA)`

## Problem Definition

The problem definition contains the objects present in the problem instance, the initial state description and the goal. 
The format of a (simple) problem definition is:

### **Example Problem Definition:**
```pddl
(define (problem PROBLEM_NAME)
  (:domain DOMAIN_NAME)
  (:objects OBJ1 OBJ2 ... OBJ_N)
  (:init ATOM1 ATOM2 ... ATOM_N)
  (:goal CONDITION_FORMULA)
)
```

**Note:** Some planners may require that the `:requirements` specification appears also in the problem definition (usually either directly before or directly after the `:domain` specification).

The initial state description (the `:init` section) is simply a list of all the ground atoms that are true in the initial state. All other atoms are by definition false. The goal description is a formula of the same form as an action precondition. All predicates used in the initial state and goal description should naturally be declared in the corresponding domain.

In difference to action preconditions, however, the initial state and goal descriptions should be *ground*, meaning that all predicate arguments should be object or constant names rather than parameters. (An exception is quantified goals in ADL domains, where of course the quantified variables may be used within the scope of the quantifier. Note, however, the even some planners that claim to support ADL do not support quantifiers in goals.)

## Typing in PDDL

PDDL has a (very) special syntax for declaring parameter and object types. If types are to be used in a domain, the domain should declare the requirement `:typing`  in `:requirements`. Type names have to be declared before they are used (which usually means before the `:predicates` declaration). This is done with the declaration:

```pddl
(:types TYPE1 TYPE2 ...)
(:objects OBJ1 - TYPE1 OBJ2 - TYPE2)
```

To declare the type of a parameter of a predicate or action one writes `?X - TYPE_OF_X`. A list of parameters of the same type can be abbreviated to `?X ?Y ?Z - TYPE_OF_XYZ`. Note that the hyphen between parameter and type name has to be "free-standing", *i.e.* surrounded by whitespace.

The syntax is the same for declaring types of objects in the problem definition.

