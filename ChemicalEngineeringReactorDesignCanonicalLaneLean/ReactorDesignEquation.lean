import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure IdealReactorTypes where
  batchReactor : Prop
  continuousStirredTank : Prop
  plugFlowReactor : Prop
  packedBedReactor : Prop

structure DesignEquationPackage (I : IdealReactorTypes) where
  massBalance : Prop
  energyBalance : Prop
  pressureDrop : Prop
  catalystEffectiveness : Prop
  residenceTimeDistribution : Prop
  idealReactorTypesClosed : I.batchReactor ∧ I.continuousStirredTank ∧ I.plugFlowReactor ∧ I.packedBedReactor

structure DesignEquationEvidence {I : IdealReactorTypes} (D : DesignEquationPackage I) where
  massBalanceClosed : D.massBalance
  energyBalanceClosed : D.energyBalance
  pressureDropClosed : D.pressureDrop
  catalystEffectivenessClosed : D.catalystEffectiveness
  residenceTimeDistributionClosed : D.residenceTimeDistribution
  idealReactorTypesClosed : D.idealReactorTypesClosed

def DesignEquationClosed {I : IdealReactorTypes} (D : DesignEquationPackage I) : Prop :=
  D.massBalance ∧ D.energyBalance ∧ D.pressureDrop ∧ D.catalystEffectiveness ∧ D.residenceTimeDistribution ∧ D.idealReactorTypesClosed

theorem design_equation_closed_from_evidence {I : IdealReactorTypes} (D : DesignEquationPackage I) (E : DesignEquationEvidence D) : DesignEquationClosed D := by
  exact And.intro E.massBalanceClosed
    (And.intro E.energyBalanceClosed
      (And.intro E.pressureDropClosed
        (And.intro E.catalystEffectivenessClosed
          (And.intro E.residenceTimeDistributionClosed E.idealReactorTypesClosed))))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse