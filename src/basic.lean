import data.complex.basic
import analysis.inner_product_space.basic
import linear_algebra.tensor_power

open_locale tensor_product

class complex_Hilbert_space (V : Type) extends inner_product_space ℂ V :=
(hilbert_ness: 1=1)

variables {ℋ : Type} [complex_Hilbert_space ℋ]

notation ℋ`^⨂`n:max := ⨂[ℂ]^n ℋ

/-- log of operator -/
def operator.log {n : ℕ} (ρ : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n := sorry

/-- trace of operator -/
def tr {n : ℕ} (ρ : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) : ℝ := sorry

/-- tensor power of operator -/
def tensor_pow_vec (σ : (ℋ^⨂1) →ₗ[ℂ] ℋ^⨂1) (n : ℕ) : 
(ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n := sorry

notation σ`^⊗`n:max := tensor_pow_vec σ n

/-- Operators can be less than each other -/
instance {n : ℕ} : has_le ((ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) := sorry

def pos_semidef {n : ℕ} (ρ : (ℋ^⨂n) →ₗ[ℂ] ℋ^⨂n) := 1=1