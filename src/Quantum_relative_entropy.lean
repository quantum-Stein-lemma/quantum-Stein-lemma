import Quantum_state

variables
{ℋ : Type} [complex_Hilbert_space ℋ]
{n : ℕ}
(ρ : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) [quantum_state ρ]
(σ : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) [quantum_state σ]

open operator

noncomputable def quantum_relative_entropy :=
tr(ρ * (log ρ - log σ))