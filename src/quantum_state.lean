import basic

variables
{ℋ : Type} [complex_Hilbert_space ℋ]

open operator

/-- Quantum state -/
class quantum_state {n : ℕ} (ρ : ℋ^⨂n →ₗ[ℂ] ℋ^⨂n) :=
(trace_one   : tr ρ = 1)
(pos_semidef : pos_semidef ρ)