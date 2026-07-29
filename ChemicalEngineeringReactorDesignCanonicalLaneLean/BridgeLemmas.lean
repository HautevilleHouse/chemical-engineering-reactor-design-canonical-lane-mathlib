import HautevilleHouse.ChemicalEngineeringReactorDesignCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ReactorWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse