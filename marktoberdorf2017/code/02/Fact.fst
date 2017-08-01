module Fact

open FStar.Mul

val factorial: nat -> Tot nat

let rec factorial n = 
  if n = 0 then 1 else n * factorial (n - 1)


val factorial': n:nat -> r:nat { r = factorial n }
let rec factorial' n = 
  if n = 0 then 1 else n * factorial' (n - 1)

val factorial'': n:nat -> r:nat { n > 10 ==> r = factorial n }
let  factorial'' = factorial'

let _ = 
  assert_norm (factorial 10 = 3628800)


val factorial4: int -> Tot int
let rec factorial4 n = 
  if n <= 0 then 1 else n * factorial4 (n - 1)

(* 1 >= 0 *)

(* n : nat *)
(* factorial : nat -> Tot nat *)
(* |-  *)
(* n * (factorial (n - 1)) >= 0 *)

(* n : nat, n != 0 |- n - 1 << n *)
