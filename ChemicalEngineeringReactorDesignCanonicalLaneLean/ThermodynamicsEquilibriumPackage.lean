import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure ThermodynamicsEquilibriumPackage where
  gibbsFreeEnergy : Prop
  equilibriumConstant : Prop
  vanTHoffEquation : Prop
  reactionEnthalpy : Prop

structure ThermodynamicsEquilibriumEvidence (T : ThermodynamicsEquilibriumPackage) where
  gibbsFreeEnergyClosed : T.gibbsFreeEnergy
  equilibriumConstantClosed : T.equilibriumConstant
  vanTHoffEquationClosed : T.vanTHoffEquation
  reactionEnthalpyClosed : T.reactionEnthalpy

def ThermodynamicsEquilibriumClosed (T : ThermodynamicsEquilibriumPackage) : Prop :=
  T.gibbsFreeEnergy ∧ T.equilibriumConstant ∧ T.vanTHoffEquation ∧ T.reactionEnthalpy

theorem thermodynamics_equilibrium_closed_from_evidence
    (T : ThermodynamicsEquilibriumPackage) (E : ThermodynamicsEquilibriumEvidence T) :
    ThermodynamicsEquilibriumClosed T := by
  exact And.intro E.gibbsFreeEnergyClosed (And.intro E.equilibriumConstantClosed
    (And.intro E.vanTHoffEquationClosed E.reactionEnthalpyClosed))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse