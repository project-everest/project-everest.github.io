module Heap

  val heap : Type
  val ref : Type -> Type

  val sel : #a:Type -> heap -> ref a -> Tot a
  val upd : #a:Type -> heap -> ref a -> a -> Tot heap

  val selUpdEq : #a:Type -> h:heap -> r:ref a -> v:a ->
        Lemma (sel (upd h r v) r  == v) [SMTPat (sel (upd h r v) r)]

  val selUpdNeq : #a:Type -> h:heap -> r1:ref a -> r2:ref a -> v:a ->
        Lemma (r1 =!= r2 ==>
               sel (upd h r1 v) r2 == sel h r2) [SMTPat (sel (upd h r1 v) r2)]
