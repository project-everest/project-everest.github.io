module CounterMST

open FStar.Heap
open FStar.ST
open FStar.MRef

let increases (n m:nat) : Type0 = n <= m

let incr (r:mref nat increases) : ST unit (requires (fun _ -> True))
                                          (ensures (fun _ _ h -> sel h r > 0))
  = r := !r + 1

(* let decr (r:mref nat increases) : St unit =  -- fails as it should
  r := (!r - 1) *)

assume val complex_procedure (r:mref nat increases) : St unit

let nonzero (n:nat) : Type0 = n > 0

let main() : St unit =
  let r = alloc 0 in
  incr r;
  witness_token r nonzero;
  complex_procedure r;
  let x = !r in
  (* assert (x > 0); -- fails as it should *)
  recall_token r nonzero;
  assert (x > 0)
