Require Import List.
Require Import Peano_dec.
Require Import Omega.



Definition maximum (ns : list nat) (H : ~ ns = nil) : { max : nat | In max ns /\ forall n : nat, In n ns -> n <= max }.
  destruct ns.
  - contradiction.
  - clear H.
    generalize n; clear n; induction ns.
    * intro n.
      exists n; split.
      -- constructor; reflexivity.
      -- intros k H; inversion H; subst; [ omega | inversion H0 ].
    * intros n; destruct (IHns a) as [ max' H ]; destruct H; clear IHns.
      rename n into head.
      rename a into n.
      destruct (le_lt_dec max' head).
      -- exists head; split.
         ** constructor; trivial.
         ** intros k Hk.
            destruct (eq_nat_dec k head).
            --- subst; omega.
            --- destruct Hk.
                elim n0; symmetry; trivial.
                specialize (H0 k H1).
                omega.
      -- exists max'; split.
         ** right; trivial.
         ** intros k Hk.
            destruct Hk.
            --- subst; omega.
            --- apply (H0 k H1).
Qed.
