import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure CatalysisPackage where
  catalystActivity : Prop
  selectivity : Prop
  deactivationKinetics : Prop
  poreDiffusion : Prop
  activeSiteDensity : Prop

structure CatalysisEvidence (C : CatalysisPackage) where
  catalystActivityClosed : C.catalystActivity
  selectivityClosed : C.selectivity
  deactivationKineticsClosed : C.deactivationKinetics
  poreDiffusionClosed : C.poreDiffusion
  activeSiteDensityClosed : C.activeSiteDensity

def CatalysisClosed (C : CatalysisPackage) : Prop :=
  C.catalystActivity ∧ C.selectivity ∧ C.deactivationKinetics ∧ C.poreDiffusion ∧ C.activeSiteDensity

theorem catalysis_closed_from_evidence (C : CatalysisPackage) (E : CatalysisEvidence C) :
    CatalysisClosed C := by
  exact And.intro E.catalystActivityClosed
    (And.intro E.selectivityClosed
      (And.intro E.deactivationKineticsClosed
        (And.intro E.poreDiffusionClosed E.activeSiteDensityClosed)))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse