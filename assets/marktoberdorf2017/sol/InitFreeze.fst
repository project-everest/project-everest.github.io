module InitFreeze

open Preorder
open Heapx
open STx
open MRefx

type rstate (a:Type) =
  | Empty : rstate a
  | Mutable : v:a -> rstate a
  | Frozen : v:a -> rstate a

let evolve_broken' (a:Type) = fun r1 r2 ->
  match r1, r2 with
  | Empty, Mutable _
  | Mutable _, Mutable _ -> True
  | Mutable v1, Frozen v2 -> v1 == v2
  | _, _ -> False
(* let evolve_broken (a:Type) : Tot (preorder (rstate a)) = evolve_broken' a
   -- fails as it should *)

let evolve' (a:Type) = fun r1 r2 ->
  match r1, r2 with
  | Empty, _
  | Mutable _, Mutable _
  | Mutable _, Frozen _  -> True 
  | Frozen v1, Frozen v2 -> v1 == v2
  | _, _ -> False
let evolve (a:Type) : Tot (preorder (rstate a)) = evolve' a

let eref (a:Type) : Type = mref (rstate a) (evolve a)

let alloc (a:Type) : ST (eref a) (requires (fun _ -> True))
                                 (ensures (fun _ r h -> Empty? (sel h r)))
  = alloc (evolve a) Empty

let read (#a:Type) (r:eref a) : ST a (requires (fun h -> ~(Empty? (sel h r))))
      (ensures (fun h v h' -> h == h' /\
                              (sel h r == Mutable v \/ sel h r == Frozen v)))
  = match (!r) with | Mutable v | Frozen v -> v

let write (#a:Type) (r:eref a) (v:a) :
      ST unit (requires (fun h -> ~(Frozen? (sel h r))))
              (ensures (fun _ _ h -> sel h r == Mutable v))
  = r := Mutable v

let freeze (#a:Type) (r:eref a) :
      ST unit (requires (fun h -> Mutable? (sel h r)))
              (ensures (fun h _ h' -> Mutable? (sel h r) /\ Frozen? (sel h' r) /\
                                Mutable?.v (sel h r) == Frozen?.v (sel h' r)))
  = r := Frozen (Mutable?.v !r)

assume val complex_procedure (r:eref int) : St unit

let main() : St unit =
  let r = alloc int in
  (* ignore (read r) -- fails like it should *)
  write r 42;
  ignore (read r);
  write r 0;
  witness r (fun rs -> ~(Empty? rs));
  freeze r;
  (* write r 7; -- fails like it should *)
  ignore (read r);
  witness r (fun rs -> rs == Frozen 0);
  complex_procedure r;
  (* ignore (read r); -- fails like it should *)
  recall r (fun rs -> ~(Empty? rs));
  let x = read r in
  (* assert (x == 0) -- fails like it should *)
  recall r (fun rs -> rs == Frozen 0);
  assert (x == 0)
