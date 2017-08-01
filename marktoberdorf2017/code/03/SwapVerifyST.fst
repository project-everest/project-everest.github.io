module SwapVerifyST

open FStar.Heap
open FStar.ST
open FStar.IO

val swap : r1:ref int -> r2:ref int -> ST unit
    (requires (fun h' -> True ))
    (ensures (fun h' _ h ->
                sel h r1 = sel h' r2 /\ sel h r2 = sel h' r1))
let swap r1 r2 =
  let t = !r1 in
  r1 := !r2;
  r2 := t

(* heap h0 *)

(* $ let t = !r1 in *)

(* t == sel h0 r1 *)

(* heap h0 *)

(* $ r1 := !r2; *)

(* heap (upd h0 r1 (sel h0 r2)) *)

(* $ r2 := t *)

(* heap (upd (upd h0 r1 (sel h0 r2)) r2 t) *)

(* sel (upd (upd h0 r1 (sel h0 r2)) r2 t) r1 = sel h0 r2 *)
(*   by SelUpd2 <==> *)
(* sel (upd h0 r1 (sel h0 r2)) r1 = sel h0 r2 *)
(*   by SelUpd1 <==> *)
(* sel h0 r2 = sel h0 r2 -- DONE (reflexivity) *)

(* sel (upd (upd h0 r1 (sel h0 r2)) r2 t) r2 = sel h0 r1 *)
(*   by SelUpd1 <==> *)
(* t = sel h0 r1 -- DONE (hypothesis) *)



(*   assume SelUpd1 :           sel (upd h r v) r  == v *)
(*   assume SelUpd2 : r<>r' ==> sel (upd h r v) r' == sel h r' *)

(*   val (!): #a:Type -> r:ref a -> ST a *)
(*     (requires (fun h -> True)) *)
(*     (ensures (fun h0 x h1 -> equal h0 h1 /\ x==sel h0 r)) *)

(*   val (:=): #a:Type -> r:ref a -> v:a -> ST unit *)
(*     (requires (fun h -> True)) *)
(*     (ensures (fun h0 x h1 -> equal h1 (upd h0 r v))) *)

