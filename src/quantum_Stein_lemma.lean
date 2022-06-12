import quantum_relative_entropy

import analysis.special_functions.complex.log
import order.liminf_limsup
import topology.sequences

open real filter

variables
{ℋ : Type} [complex_Hilbert_space ℋ]

/--
Hypothesis test
-/
class test {n : ℕ} (Aₙ : ℋ^⨂n →ₗ[ℂ] ℋ^⨂n) :=
(geq_zero_leq_one : 0 ≤ Aₙ ∧ Aₙ ≤ 1)

variables 
(ρ : ℋ^⨂1 →ₗ[ℂ] ℋ^⨂1) [quantum_state ρ]
(σ : ℋ^⨂1 →ₗ[ℂ] ℋ^⨂1) [quantum_state σ]

/--
Probability of guessing ρ^⊗n when actually σ^⊗n.
-/
noncomputable def β {n : ℕ} (Aₙ : ℋ^⨂n →ₗ[ℂ] ℋ^⨂n) :=
tr(σ^⊗n * Aₙ)

/--
Probability of guessing σ^⊗n when actually ρ^⊗n.
-/
noncomputable def α {n : ℕ} (Aₙ : ℋ^⨂n →ₗ[ℂ] ℋ^⨂n) :=
tr(ρ^⊗n * (1 - Aₙ))

/--
What is the minimum?
-/
noncomputable def βmin (n : ℕ) (ε : ℝ) :=
Inf {prob : ℝ | ∃ (Aₙ : ℋ^⨂n →ₗ[ℂ] ℋ^⨂n) [test Aₙ], β σ Aₙ = prob ∧ α ρ Aₙ ≤ ε}

/--
Quantum Stein's lemma.
-/
lemma log_inf_tends_to_quantum_relative_entropy  : 
∀ (ε : ℝ) [ε > 0],
lim at_top (λn:ℕ, log(βmin ρ σ n ε)/n) = - quantum_relative_entropy ρ σ :=
begin
  sorry,
end
