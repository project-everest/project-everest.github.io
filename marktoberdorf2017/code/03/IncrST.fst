module IncrST

open FStar.Heap
open FStar.ST

(* val incr : r:ref int -> St unit *)

val incr : r:ref int -> ST unit (requires (fun h0 -> True))
                           (ensures (fun h0 _ h1 -> sel h1 r = sel h0 r + 1))
let incr r = (r := (!r + 1))
