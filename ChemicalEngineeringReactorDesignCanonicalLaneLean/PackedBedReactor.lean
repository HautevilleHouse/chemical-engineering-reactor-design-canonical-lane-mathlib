import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure PackedBedReactorModel where
  catalystParticleSize : Prop
  voidFraction : Prop
  pressureDrop : Prop
  axialDispersion : Prop
  reactionKinetics : Prop

structure PackedBedReactorEvidence (M : PackedBedReactorModel) where
  catalystParticleSizeClosed : M.catalystParticleSize
  voidFractionClosed : M.voidFraction
  pressureDropClosed : M.pressureDrop
  axialDispersionClosed : M.axialDispersion
  reactionKineticsClosed : M.reactionKinetics

def PackedBedReactorClosed (M : PackedBedReactorModel) : Prop :=
  M.catalystParticleSize ∧ M.voidFraction ∧ M.pressureDrop ∧ M.axialDispersion ∧ M.reactionKinetics

theorem packed_bed_reactor_closed_from_evidence
    (M : PackedBedReactorModel) (E : PackedBedReactorEvidence M) :
    PackedBedReactorClosed M := by
  exact And.intro E.catalystParticleSizeClosed
    (And.intro E.voidFractionClosed
      (And.intro E.pressureDropClosed
        (And.intro E.axialDispersionClosed E.reactionKineticsClosed)))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse