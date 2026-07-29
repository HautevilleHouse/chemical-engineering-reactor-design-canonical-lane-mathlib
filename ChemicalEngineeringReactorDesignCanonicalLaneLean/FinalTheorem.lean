import HautevilleHouse.ChemicalEngineeringReactorDesignCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

def ConstrainedReactorDesignClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_reactor_design_endgame (A : AdmissibleClass) :
    ConstrainedReactorDesignClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse