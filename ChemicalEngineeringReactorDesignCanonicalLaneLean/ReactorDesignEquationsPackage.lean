import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure ReactorDesignEquationsPackage where
  moleBalance : Prop
  designEquation : Prop
  volumeCalculation : Prop
  conversionRelation : Prop

structure ReactorDesignEquationsEvidence (R : ReactorDesignEquationsPackage) where
  moleBalanceClosed : R.moleBalance
  designEquationClosed : R.designEquation
  volumeCalculationClosed : R.volumeCalculation
  conversionRelationClosed : R.conversionRelation

def ReactorDesignEquationsClosed (R : ReactorDesignEquationsPackage) : Prop :=
  R.moleBalance ∧ R.designEquation ∧ R.volumeCalculation ∧ R.conversionRelation

theorem reactor_design_equations_closed_from_evidence
    (R : ReactorDesignEquationsPackage) (E : ReactorDesignEquationsEvidence R) :
    ReactorDesignEquationsClosed R := by
  exact And.intro E.moleBalanceClosed (And.intro E.designEquationClosed
    (And.intro E.volumeCalculationClosed E.conversionRelationClosed))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse