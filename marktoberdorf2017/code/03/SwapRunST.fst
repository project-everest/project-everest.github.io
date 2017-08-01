module SwapRunST

open FStar.Heap
open FStar.ST
open FStar.IO

val swap_add_sub : r1:ref int -> r2:ref int -> ST unit
    (requires (fun h' -> addr_of r1 =!= addr_of r2 ))
    (ensures (fun h' _ h ->
                sel h r1 = sel h' r2 /\ sel h r2 = sel h' r1))
let swap_add_sub r1 r2 =
  r1 := !r1 + !r2;
  r2 := !r1 - !r2;
  r1 := !r1 - !r2

let main =
  let r1 = alloc 1 in
  let r2 = alloc 2 in
  swap_add_sub r1 r2;
  print_string ("r1=" ^ string_of_int !r1 ^ "; " ^
                "r2=" ^ string_of_int !r2 ^ "\n")
