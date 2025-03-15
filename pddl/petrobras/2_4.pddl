(define 
 (problem original)
 (:domain petrobras)

 (:objects
  ship1 - ship
  ship2 - ship

  P1 - port         ; rio
  P2 - port         ; santos

  F1 - platform
  F2 - platform
  F3 - platform
  F4 - platform
  G1 - platform
  G2 - platform

  cargo1 - cargo
  cargo2 - cargo
  cargo3 - cargo
  cargo4 - cargo
 )

 (:init
  (= (total_fuel_used) 0)

  (at_ ship1 P1)
  (at_ ship2 P1)
  (docked ship1 P1)
  (docked ship2 P1)

  (= (current_fuel ship1) 600)
  (= (current_fuel ship2) 600)

  (= (current_load ship1) 0)
  (= (current_load ship2) 0)

  (= (fuel_capacity ship1) 600)
  (= (load_capacity ship1) 100)
  (= (fuel_capacity ship2) 600)
  (= (load_capacity ship2) 100)

  (= (current_docking_capacity P1) 1)
  (= (current_docking_capacity P2) 1)
  (= (current_docking_capacity F1) 1)
  (= (current_docking_capacity F2) 1)
  (= (current_docking_capacity F3) 1)
  (= (current_docking_capacity F4) 1)
  (= (current_docking_capacity G1) 1)
  (= (current_docking_capacity G2) 1)
  (= (total_docking_capacity P1) 2)
  (= (total_docking_capacity P2) 2)
  (= (total_docking_capacity F1) 1)
  (= (total_docking_capacity F2) 1)
  (= (total_docking_capacity F3) 1)
  (= (total_docking_capacity F4) 1)
  (= (total_docking_capacity G1) 1)
  (= (total_docking_capacity G2) 1)

  (can_refuel P1)
  (can_refuel P2)
  (can_refuel G2)

; ==== CARGOS ====
; ================

  (at_ cargo1 P1)
  (at_ cargo2 P1)
  (at_ cargo3 P2)
  (at_ cargo4 P2)

  (= (weight cargo1) 20)
  (= (weight cargo2) 5)
  (= (weight cargo3) 15)
  (= (weight cargo4) 8)


; ==== DISTANCES ====
; ===================
  (= (consumption_empty P1 P1) 999)
  (= (consumption_empty P2 P2) 999)
  (= (consumption_empty F1 F1) 999)
  (= (consumption_empty F2 F2) 999)
  (= (consumption_empty F3 F3) 999)
  (= (consumption_empty F4 F4) 999)
  (= (consumption_empty G1 G1) 999)
  (= (consumption_empty G2 G2) 999)

  (= (consumption_full P1 P1) 999)
  (= (consumption_full P2 P2) 999)
  (= (consumption_full F1 F1) 999)
  (= (consumption_full F2 F2) 999)
  (= (consumption_full F3 F3) 999)
  (= (consumption_full F4 F4) 999)
  (= (consumption_full G1 G1) 999)
  (= (consumption_full G2 G2) 999)

; ==== DISTANCES ====
; ===================

  (= (distance P1 P2) 200)
  (= (distance P1 F1) 300)
  (= (distance P1 F2) 160)
  (= (distance P1 F3) 280)
  (= (distance P1 F4) 200)
  (= (distance P1 G1) 350)
  (= (distance P1 G2) 400)

  (= (consumption_empty P1 P2) 40)
  (= (consumption_empty P1 F1) 60)
  (= (consumption_empty P1 F2) 32)
  (= (consumption_empty P1 F3) 56)
  (= (consumption_empty P1 F4) 40)
  (= (consumption_empty P1 G1) 70)
  (= (consumption_empty P1 G2) 80)

  (= (consumption_full P1 P2) 66)
  (= (consumption_full P1 F1) 100)
  (= (consumption_full P1 F2) 53)
  (= (consumption_full P1 F3) 93)
  (= (consumption_full P1 F4) 66)
  (= (consumption_full P1 G1) 116)
  (= (consumption_full P1 G2) 133)

  (= (distance P2 P1) 200)
  (= (distance P2 F1) 380)
  (= (distance P2 F2) 290)
  (= (distance P2 F3) 320)
  (= (distance P2 F4) 340)
  (= (distance P2 G1) 300)
  (= (distance P2 G2) 180)

  (= (consumption_empty P2 P1) 40)
  (= (consumption_empty P2 F1) 76)
  (= (consumption_empty P2 F2) 58)
  (= (consumption_empty P2 F3) 64)
  (= (consumption_empty P2 F4) 68)
  (= (consumption_empty P2 G1) 60)
  (= (consumption_empty P2 G2) 36)

  (= (consumption_full P2 P1) 66)
  (= (consumption_full P2 F1) 126)
  (= (consumption_full P2 F2) 96)
  (= (consumption_full P2 F3) 106)
  (= (consumption_full P2 F4) 113)
  (= (consumption_full P2 G1) 100)
  (= (consumption_full P2 G2) 60)

  (= (distance F1 P1) 300)
  (= (distance F1 P2) 380)
  (= (distance F1 F2) 168)
  (= (distance F1 F3) 168)
  (= (distance F1 F4) 120)
  (= (distance F1 G1) 468)
  (= (distance F1 G2) 580)

  (= (consumption_empty F1 P1) 60)
  (= (consumption_empty F1 P2) 76)
  (= (consumption_empty F1 F2) 33)
  (= (consumption_empty F1 F3) 33)
  (= (consumption_empty F1 F4) 24)
  (= (consumption_empty F1 G1) 93)
  (= (consumption_empty F1 G2) 116)

  (= (consumption_full F1 P1) 100)
  (= (consumption_full F1 P2) 126)
  (= (consumption_full F1 F2) 56)
  (= (consumption_full F1 F3) 56)
  (= (consumption_full F1 F4) 40)
  (= (consumption_full F1 G1) 156)
  (= (consumption_full F1 G2) 193)

  (= (distance F2 P1) 160)
  (= (distance F2 P2) 290)
  (= (distance F2 F1) 168)
  (= (distance F2 F3) 240)
  (= (distance F2 F4) 120)
  (= (distance F2 G1) 580)
  (= (distance F2 G2) 468)

  (= (consumption_empty F2 P1) 32)
  (= (consumption_empty F2 P2) 58)
  (= (consumption_empty F2 F1) 33)
  (= (consumption_empty F2 F3) 48)
  (= (consumption_empty F2 F4) 24)
  (= (consumption_empty F2 G1) 116)
  (= (consumption_empty F2 G2) 93)

  (= (consumption_full F2 P1) 53)
  (= (consumption_full F2 P2) 96)
  (= (consumption_full F2 F1) 56)
  (= (consumption_full F2 F3) 80)
  (= (consumption_full F2 F4) 40)
  (= (consumption_full F2 G1) 193)
  (= (consumption_full F2 G2) 156)

  (= (distance F3 P1) 280)
  (= (distance F3 P2) 320)
  (= (distance F3 F1) 168)
  (= (distance F3 F2) 240)
  (= (distance F3 F4) 120)
  (= (distance F3 G1) 420)
  (= (distance F3 G2) 380)

  (= (consumption_empty F3 P1) 56)
  (= (consumption_empty F3 P2) 64)
  (= (consumption_empty F3 F1) 33)
  (= (consumption_empty F3 F2) 48)
  (= (consumption_empty F3 F4) 24)
  (= (consumption_empty F3 G1) 84)
  (= (consumption_empty F3 G2) 76)

  (= (consumption_full F3 P1) 93)
  (= (consumption_full F3 P2) 106)
  (= (consumption_full F3 F1) 56)
  (= (consumption_full F3 F2) 80)
  (= (consumption_full F3 F4) 40)
  (= (consumption_full F3 G1) 140)
  (= (consumption_full F3 G2) 126)

  (= (distance F4 P1) 200)
  (= (distance F4 P2) 340)
  (= (distance F4 F1) 120)
  (= (distance F4 F2) 120)
  (= (distance F4 F3) 120)
  (= (distance F4 G1) 500)
  (= (distance F4 G2) 520)

  (= (consumption_empty F4 P1) 40)
  (= (consumption_empty F4 P2) 68)
  (= (consumption_empty F4 F1) 24)
  (= (consumption_empty F4 F2) 24)
  (= (consumption_empty F4 F3) 24)
  (= (consumption_empty F4 G1) 100)
  (= (consumption_empty F4 G2) 104)

  (= (consumption_full F4 P1) 66)
  (= (consumption_full F4 P2) 113)
  (= (consumption_full F4 F1) 40)
  (= (consumption_full F4 F2) 40)
  (= (consumption_full F4 F3) 40)
  (= (consumption_full F4 G1) 166)
  (= (consumption_full F4 G2) 173)

  (= (distance G1 P1) 350)
  (= (distance G1 P2) 300)
  (= (distance G1 F1) 468)
  (= (distance G1 F2) 580)
  (= (distance G1 F3) 420)
  (= (distance G1 F4) 500)
  (= (distance G1 G2) 200)

  (= (consumption_empty G1 P1) 70)
  (= (consumption_empty G1 P2) 60)
  (= (consumption_empty G1 F1) 93)
  (= (consumption_empty G1 F2) 116)
  (= (consumption_empty G1 F3) 84)
  (= (consumption_empty G1 F4) 100)
  (= (consumption_empty G1 G2) 40)

  (= (consumption_full G1 P1) 116)
  (= (consumption_full G1 P2) 100)
  (= (consumption_full G1 F1) 156)
  (= (consumption_full G1 F2) 193)
  (= (consumption_full G1 F3) 140)
  (= (consumption_full G1 F4) 166)
  (= (consumption_full G1 G2) 66)

  (= (distance G2 P1) 400)
  (= (distance G2 P2) 180)
  (= (distance G2 F1) 580)
  (= (distance G2 F2) 468)
  (= (distance G2 F3) 380)
  (= (distance G2 F4) 520)
  (= (distance G2 G1) 200)

  (= (consumption_empty G2 P1) 80)
  (= (consumption_empty G2 P2) 36)
  (= (consumption_empty G2 F1) 116)
  (= (consumption_empty G2 F2) 93)
  (= (consumption_empty G2 F3) 76)
  (= (consumption_empty G2 F4) 104)
  (= (consumption_empty G2 G1) 40)

  (= (consumption_full G2 P1) 133)
  (= (consumption_full G2 P2) 60)
  (= (consumption_full G2 F1) 193)
  (= (consumption_full G2 F2) 156)
  (= (consumption_full G2 F3) 126)
  (= (consumption_full G2 F4) 173)
  (= (consumption_full G2 G1) 66)
 )

(:goal
  (and
   (at_ cargo1 F1)  
   (at_ cargo2 F4)
   (at_ cargo3 F4)
   (at_ cargo4 G2)))

 (:metric minimize (total_fuel_used))

)
