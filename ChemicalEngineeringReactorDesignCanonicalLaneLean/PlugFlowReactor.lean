import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure PFRModel where
  inletConcentration : Prop
  volumetricFlowRate : Prop
  reactionRateExpression : Prop
  conversionProfile : Prop
  lengthConstraint : Prop

structure PFREvidence (M : PFRModel) where
  inletConcentrationClosed : M.inletConcentration
  volumetricFlowRateClosed : M.volumetricFlowRate
  reactionRateExpressionClosed : M.reactionRateExpression
  conversionProfileClosed : M.conversionProfile
  lengthConstraintClosed : M.lengthConstraint

def PFRClosed (M : PFRModel) : Prop :=
  M.inletConcentration ∧ M.volumetricFlowRate ∧ M.reactionRateExpression ∧ M.conversionProfile ∧ M.lengthConstraint

theorem pfr_closed_from_evidence
    (M : PFRModel) (E : PFREvidence M) : PFRClosed M := by
  exact And.intro E.inletConcentrationClosed
    (And.intro E.volumetricFlowRateClosed
      (And.intro E.reactionRateExpressionClosed
        (And.intro E.conversionProfileClosed E.lengthConstraintClosed)))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse