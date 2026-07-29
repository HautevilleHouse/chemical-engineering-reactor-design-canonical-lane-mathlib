import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure CatalysisPackage where
  catalystActivity : Prop
  langmuirHinshelwoodModel : Prop
  rateLimitingStep : Prop
  deactivationMechanism : Prop

structure CatalysisEvidence (C : CatalysisPackage) where
  catalystActivityClosed : C.catalystActivity
  langmuirHinshelwoodModelClosed : C.langmuirHinshelwoodModel
  rateLimitingStepClosed : C.rateLimitingStep
  deactivationMechanismClosed : C.deactivationMechanism

def CatalysisClosed (C : CatalysisPackage) : Prop :=
  C.catalystActivity ∧ C.langmuirHinshelwoodModel ∧ C.rateLimitingStep ∧ C.deactivationMechanism

theorem catalysis_closed_from_evidence
    (C : CatalysisPackage) (E : CatalysisEvidence C) :
    CatalysisClosed C := by
  exact And.intro E.catalystActivityClosed (And.intro E.langmuirHinshelwoodModelClosed
    (And.intro E.rateLimitingStepClosed E.deactivationMechanismClosed))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse