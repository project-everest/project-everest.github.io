module FibonacciST

open FStar.Heap
open FStar.ST

let rec fibonacci (n:nat) : Tot nat =
  if n <= 1 then 1 else fibonacci (n-1) + fibonacci (n-2)

let rec fibonacci_st' (i:pos) (n:nat{n >= i}) (r1 r2:ref nat) : ST unit
          (requires (fun h0 -> addr_of r1 <> addr_of r2 /\
                               sel h0 r1 = fibonacci (i-1) /\
                               sel h0 r2 = fibonacci i ))
          (ensures (fun h0 a h1 -> sel h1 r1 = fibonacci (n-1) /\
                                   sel h1 r2 = fibonacci n /\
                    modifies (Set.union (Set.singleton (addr_of r1))
                                        (Set.singleton (addr_of r2))) h0 h1)) =
  if i < n then
    (* computes fibonacci (i+1) and fibonacci i
       from fibonacci i and fibonacci (i-1) *)
    (let temp = !r2 in
     r2 := !r1 + !r2;
     r1 := temp;
    (* then tail-recursive call to compute the rest *)
     fibonacci_st' (i+1) n r1 r2)

let fibonacci_st (n:nat) : ST nat
      (requires (fun h0 -> True))
      (ensures (fun h0 x h1 -> modifies Set.empty h0 h1 /\ x = fibonacci n)) =
  if n <= 1 then 1
  else (let r1 = alloc 1 in
        let r2 = alloc 1 in
        fibonacci_st' 1 n r1 r2;
        !r2)
