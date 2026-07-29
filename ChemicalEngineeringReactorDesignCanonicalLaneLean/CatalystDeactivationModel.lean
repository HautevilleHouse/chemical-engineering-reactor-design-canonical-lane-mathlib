import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure CatalystDeactivationModel where
  initialActivity : Prop
  decayRateExpression : Prop
  regenerationCycle : Prop
  activityProfile : Prop

structure CatalystDeactivationEvidence (M : CatalystDeactivationModel) where
  initialActivityClosed : M.initialActivity
  decayRateExpressionClosed : M.decayRateExpression
  regenerationCycleClosed : M.regenerationCycle
  activityProfileClosed : M.activityProfile

def CatalystDeactivationClosed (M : CatalystDeactivationModel) : Prop :=
  M.initialActivity ∧ M.decayRateExpression ∧ M.regenerationCycle ∧ M.activityProfile

theorem catalyst_deactivation_closed_from_evidence
    (M : CatalystDeactivationModel) (E : CatalystDeactivationEvidence M) :
    CatalystDeactivationClosed M := by
  exact And.intro E.initialActivityClosed
    (And.intro E.decayRateExpressionClosed
      (And.intro E.regenerationCycleClosed E.activityProfileClosed))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse