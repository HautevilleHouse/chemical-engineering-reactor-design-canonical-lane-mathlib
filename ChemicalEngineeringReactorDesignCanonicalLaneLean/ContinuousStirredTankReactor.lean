import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure CSTRModel where
  inletFlow : Prop
  outletFlow : Prop
  reactionRate : Prop
  mixingEfficiency : Prop
  steadyStateCondition : Prop

structure CSTREvidence (M : CSTRModel) where
  inletFlowClosed : M.inletFlow
  outletFlowClosed : M.outletFlow
  reactionRateClosed : M.reactionRate
  mixingEfficiencyClosed : M.mixingEfficiency
  steadyStateConditionClosed : M.steadyStateCondition

def CSTRClosed (M : CSTRModel) : Prop :=
  M.inletFlow ∧ M.outletFlow ∧ M.reactionRate ∧ M.mixingEfficiency ∧ M.steadyStateCondition

theorem cstr_closed_from_evidence
    (M : CSTRModel) (E : CSTREvidence M) : CSTRClosed M := by
  exact And.intro E.inletFlowClosed
    (And.intro E.outletFlowClosed
      (And.intro E.reactionRateClosed
        (And.intro E.mixingEfficiencyClosed E.steadyStateConditionClosed)))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse