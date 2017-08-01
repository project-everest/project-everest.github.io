module FactorialST

open FStar.Heap
open FStar.ST
open FStar.Mul

val factorial_tot : nat -> Tot nat
let rec factorial_tot x = if x = 0 then 1 else x * factorial_tot (x - 1)


(* TODO: write a stronger ensures clause for factorial that proves
         it does the same thing as factorial_tot *)
val factorial : r1:ref nat -> r2:ref nat -> ST unit
      (requires (fun h0 -> True))
      (ensures (fun h0 () h1 -> True))
let rec factorial r1 r2 =
  let x1 = !r1 in
  if x1 = 0
  then r2 := 1
  else 
    (r1 := x1 - 1;
     factorial r1 r2;
     r2 := !r2 * x1)
