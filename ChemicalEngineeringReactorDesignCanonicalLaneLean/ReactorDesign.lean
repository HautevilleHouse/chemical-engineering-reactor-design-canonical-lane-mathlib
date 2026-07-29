import HautevilleHouse.ChemicalEngineeringReactorDesignCanonicalLaneLean.Thermodynamics

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure ReactorDesignPackage where
  reactorType : Prop
  designEquation : Prop
  conversionTarget : Prop
  catalystEffectiveness : Prop
  scaleUpCriteria : Prop

structure ReactorDesignEvidence (R : ReactorDesignPackage) where
  reactorTypeClosed : R.reactorType
  designEquationClosed : R.designEquation
  conversionTargetClosed : R.conversionTarget
  catalystEffectivenessClosed : R.catalystEffectiveness
  scaleUpCriteriaClosed : R.scaleUpCriteria

def ReactorDesignClosed (R : ReactorDesignPackage) : Prop :=
  R.reactorType ∧ R.designEquation ∧ R.conversionTarget ∧ R.catalystEffectiveness ∧ R.scaleUpCriteria

theorem reactor_design_closed_from_evidence (R : ReactorDesignPackage) (E : ReactorDesignEvidence R) :
    ReactorDesignClosed R := by
  exact And.intro E.reactorTypeClosed (And.intro E.designEquationClosed (And.intro E.conversionTargetClosed (And.intro E.catalystEffectivenessClosed E.scaleUpCriteriaClosed)))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse