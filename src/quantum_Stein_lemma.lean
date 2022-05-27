import Quantum_relative_entropy

import analysis.special_functions.complex.log
import order.liminf_limsup
import topology.sequences

open real filter

variables
{ℋ : Type} [complex_Hilbert_space ℋ]

variables
{ρ : (ℋ^⨂1) →ₗ[ℂ] ℋ^⨂1} [quantum_state ρ]
{σ : (ℋ^⨂1) →ₗ[ℂ] (ℋ^⨂1)} [quantum_state σ]

variable {n : ℕ}

/--
Hypothesis test
-/
class test (Aₙ : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) :=
(geq_zero_leq_one : 0 ≤ Aₙ ∧ Aₙ ≤ 1)

/--
Probability of guessing ρ^⊗n when actually σ^⊗n.
-/
noncomputable def prob_ρₙ_when_σₙ (Aₙ : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) [test Aₙ] :=
tr((σ^⊗n) * Aₙ)

variables (Aₙ : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) [test Aₙ]

#check prob_ρₙ_when_σₙ Aₙ

example : ∃ε:ℝ, prob_ρₙ_when_σₙ Aₙ = ε := sorry

/--
Probability of guessing σ^⊗n when actually ρ^⊗n.
-/
noncomputable def prob_σₙ_when_ρₙ (Aₙ : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) [test Aₙ] :=
tr((ρ^⊗n) * (1 - Aₙ))

/--
What is the minimum?
-/
noncomputable def min_prob_ρₙ_when_σₙ_if_prob_σₙ_when_ρₙ_leq_ε (ε : ℝ) [ε > 0] :=
Inf {prob : ℝ | ∃ (Aₙ : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) [test Aₙ], (tr((σ^⊗n) * Aₙ) = prob) ∧ (tr((ρ^⊗n) * (1 - Aₙ)) ≤ ε)}

-- def min_prob_ρₙ_when_σₙ_if_prob_σₙ_when_ρₙ_leq_ε (ε : ℝ) [ε > 0] :=
-- Inf {prob_ρₙ_when_σₙ Aₙ : ℝ | Aₙ : (ℋ^⊗n) →ₗ[ℂ] (ℋ^⊗n) ∧ test Aₙ ∧ prob_σₙ_when_ρₙ Aₙ ≤ ε}

/--
Quantum Stein's lemma.
-/
lemma log_min_tends_to_quantum_relative_entropy' : 
∀ (ε : ℝ) [ε > 0],
lim at_top (λn:ℕ, log(Inf {prob : ℝ | ∃ (Aₙ : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) [test Aₙ], (tr((σ^⊗n) * Aₙ) = prob) ∧ (tr((ρ^⊗n) * (1 - Aₙ)) ≤ ε)})/n) = - quantum_relative_entropy ρ σ :=
begin
  -- follows from the two lemmas above
  sorry,
end

-- lemma log_inf_tends_to_quantum_relative_entropy : 
-- ∀ (ε : ℝ) [ε > 0],
-- lim at_top (λn:ℕ, log(Inf_prob_ρₙ_when_σₙ_if_prob_σₙ_when_ρₙ_leq_ε n ε)/n) = - quantum_relative_entropy ρ σ :=
-- begin
--   -- follows from the two lemmas above
--   sorry,
-- end