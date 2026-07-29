import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure ReactionKineticsModel where
  rateConstant : Prop
  activationEnergy : Prop
  concentrationTerms : Prop
  temperatureDependence : Prop
  equilibriumConstant : Prop

structure ReactionKineticsEvidence (M : ReactionKineticsModel) where
  rateConstantClosed : M.rateConstant
  activationEnergyClosed : M.activationEnergy
  concentrationTermsClosed : M.concentrationTerms
  temperatureDependenceClosed : M.temperatureDependence
  equilibriumConstantClosed : M.equilibriumConstant

def ReactionKineticsClosed (M : ReactionKineticsModel) : Prop :=
  M.rateConstant ∧ M.activationEnergy ∧ M.concentrationTerms ∧ M.temperatureDependence ∧ M.equilibriumConstant

theorem reaction_kinetics_closed_from_evidence
    (M : ReactionKineticsModel) (E : ReactionKineticsEvidence M) :
    ReactionKineticsClosed M := by
  exact And.intro E.rateConstantClosed
    (And.intro E.activationEnergyClosed
      (And.intro E.concentrationTermsClosed
        (And.intro E.temperatureDependenceClosed E.equilibriumConstantClosed)))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse