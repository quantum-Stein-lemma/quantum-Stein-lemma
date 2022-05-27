import Quantum_relative_entropy

import analysis.special_functions.complex.log
import order.liminf_limsup
import topology.sequences

open real filter

variables
(ℋ : Type) [complex_Hilbert_space ℋ]

variables
{ρ : ℋ →ₗ[ℂ] ℋ} [quantum_state ρ]
{σ : ℋ →ₗ[ℂ] ℋ} [quantum_state σ]

variable {n : ℕ}

-- TODOS: tensor power of vector

/--
Hypothesis test
-/
def test (Aₙ : (ℋ^⊗n) →ₗ[ℂ] (ℋ^⊗n)) :=
0 ≤ Aₙ ∧ Aₙ ≤ 1 

/--
Probability of guessing ρ^⊗n when actually σ^⊗n.
-/
def prob_ρₙ_when_σₙ (Aₙ : (ℋ^⊗n) →ₗ[ℂ] (ℋ^⊗n)) [test Aₙ] :=
tr(σ^⊗n * Aₙ)

/--
Probability of guessing σ^⊗n when actually ρ^⊗n.
-/
def prob_σₙ_when_ρₙ (Aₙ : (ℋ^⊗n) →ₗ[ℂ] (ℋ^⊗n)) [test Aₙ] :=
tr(ρ^⊗n * (1 - Aₙ))

/--
What is the minimum?
-/
def min_prob_ρₙ_when_σₙ_if_prob_σₙ_when_ρₙ_leq_ε (ε : ℝ) [ε > 0] :=
min {prob_ρₙ_when_σₙ Aₙ | Aₙ : (ℋ^⊗n) →ₗ[ℂ] (ℋ^⊗n) ∧ test Aₙ ∧ prob_σₙ_when_ρₙ Aₙ ≤ ε}

/--
Quantum Stein's lemma.
-/
lemma log_minimum_tends_to_quantum_relative_entropy : 
∀ (ε : ℝ) [ε > 0],
lim at_top (λn:ℕ, log min_prob_ρₙ_when_σₙ_if_prob_σₙ_when_ρₙ_leq_ε n ε / n) = - quantum_relative_entropy ρ σ :=
begin
  -- follows from the two lemmas above
  sorry,
end