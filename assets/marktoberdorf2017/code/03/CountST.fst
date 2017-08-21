module CountST

open FStar.Heap
open FStar.ST

let rec count (r:ref nat) (n:nat) : ST unit (requires (fun h0 -> True))
    (ensures (fun h0 () h1 -> sel h1 r = sel h0 r + n
                           /\ modifies (Set.singleton (addr_of r)) h0 h1)) = 
  if n > 0 then (r := !r + 1; count r (n-1))


(* This no longer works, but it's not good style anyway
let rec count' r (n:nat) : ST unit (requires (fun h0 -> True))
    (ensures (fun h0 () h1 -> h1 `equal` upd h0 r (sel h0 r + n))) = 
  if n > 0 then (r := !r + 1; count' r (n-1))
*)
