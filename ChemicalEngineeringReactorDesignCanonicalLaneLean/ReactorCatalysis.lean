import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure CatalystProperties where
  surfaceArea : Type u
  poreSizeDistribution : Type v
  activeSiteDensity : Type w
  catalystDeactivation : Prop
  selectivity : Prop

structure ReactionMechanism (C : CatalystProperties) where
  adsorption : Prop
  surfaceReaction : Prop
  desorption : Prop
  langmuirHinshelwoodKinetics : Prop
  eleyRidealKinetics : Prop
  catalystPropertiesClosed : C.catalystDeactivation ∧ C.selectivity

structure CatalysisEvidence {C : CatalystProperties} (R : ReactionMechanism C) where
  adsorptionClosed : R.adsorption
  surfaceReactionClosed : R.surfaceReaction
  desorptionClosed : R.desorption
  langmuirHinshelwoodKineticsClosed : R.langmuirHinshelwoodKinetics
  eleyRidealKineticsClosed : R.eleyRidealKinetics
  catalystPropertiesClosed : R.catalystPropertiesClosed

def CatalysisClosed {C : CatalystProperties} (R : ReactionMechanism C) : Prop :=
  R.adsorption ∧ R.surfaceReaction ∧ R.desorption ∧ R.langmuirHinshelwoodKinetics ∧ R.eleyRidealKinetics ∧ R.catalystPropertiesClosed

theorem catalysis_closed_from_evidence {C : CatalystProperties} (R : ReactionMechanism C) (E : CatalysisEvidence R) : CatalysisClosed R := by
  exact And.intro E.adsorptionClosed
    (And.intro E.surfaceReactionClosed
      (And.intro E.desorptionClosed
        (And.intro E.langmuirHinshelwoodKineticsClosed
          (And.intro E.eleyRidealKineticsClosed E.catalystPropertiesClosed))))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse