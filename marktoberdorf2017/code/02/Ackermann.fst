module Ackermann

val ackermann: m:nat -> n:nat -> Tot nat

let rec ackermann m n =
  if m=0 then n + 1
  else if n = 0 then ackermann (m - 1) 1
  else ackermann 
    (m - 1)
    (ackermann m (n - 1)) 


val ackermann2: n:nat -> m:nat -> Tot nat (decreases %[m;n])

let rec ackermann2 n m =
  if m=0 then n + 1
  else if n = 0 then ackermann2 1 (m - 1)
  else ackermann2 
    (ackermann2 (n - 1) m) 
    (m - 1)
    
