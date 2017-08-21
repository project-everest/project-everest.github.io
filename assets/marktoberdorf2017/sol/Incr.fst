module Incr

(* val incr : int -> int *)
(* val incr : x:int -> y:int{x < y} *)
(* val incr : x:int -> y:int{y = x + 1} *)
(* val incr : nat -> nat *)
(* val incr : x:int{x>3} -> y:int{y>4} *)
let incr x = x + 1
