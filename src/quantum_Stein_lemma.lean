import POVM
import Quantum_relative_entropy

import analysis.special_functions.complex.log

open complex

variables
(ℋ : Type) [complex_Hilbert_space ℋ]

variables
(A : λ n : ℕ, ℋ^⊗n →ₗ[ℂ] ℋ^⊗n) [∀ n, POVM {A n, 1 - A n}]

variables
{ρ: ℋ →ₗ[ℂ] ℋ} [quantum_state ρ]
{σ: ℋ →ₗ[ℂ] ℋ} [quantum_state σ]

variable (n : ℕ)

/--
Probability of guessing σ^⊗n when actually ρ^⊗n.
-/
def prob_σₙ_when_ρₙ_of_Aₙ := tr(ρ^⊗n * (1 - A n))

/--
Probability of guessing ρ^⊗n when actually σ^⊗n.
-/
def prob_ρₙ_when_σₙ_of_Aₙ := tr(σ^⊗n * (A n))

/--
What is the minimum?
-/
def min_prob_ρₙ_when_σₙ_if_prob_σₙ_when_ρₙ_leq_ε (ε > 0) :=
min {prob_ρₙ_when_σₙ_of_Aₙ A n | A : λ n : ℕ, ℋ^⊗n →ₗ[ℂ] ℋ^⊗n ∧ ∀ n, POVM {A n, 1 - A n} ∧ prob_σₙ_when_ρₙ_of_Aₙ A n ≤ ε}

/--
Quantum Stein's lemma.
-/
lemma log_minimum_achieves_quantum_relative_entropy : 
∀ ε > 0, ∀ δ > 0,
∃ k : ℕ, ∀ n > k,
1/n * log min_prob_ρₙ_when_σₙ_if_prob_σₙ_when_ρₙ_leq_ε n ε ≥ quantum_relative_entropy ρ σ - δ :=
begin
  sorry
end