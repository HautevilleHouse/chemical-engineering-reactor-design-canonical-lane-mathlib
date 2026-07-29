import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure ReactionRatePackage where
  species : List String
  stoichiometricMatrix : List (List Float)
  rateExpressions : List (String → Float)
  rateConstants : List Float
  powerLawKinetics : Prop
  massActionValid : Prop

structure ReactionRateEvidence (R : ReactionRatePackage) where
  powerLawKineticsClosed : R.powerLawKinetics
  massActionValidClosed : R.massActionValid

def ReactionRateClosed (R : ReactionRatePackage) : Prop :=
  R.powerLawKinetics ∧ R.massActionValid

theorem reaction_rate_closed_from_evidence (R : ReactionRatePackage)
    (E : ReactionRateEvidence R) : ReactionRateClosed R := by
  exact And.intro E.powerLawKineticsClosed E.massActionValidClosed

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse