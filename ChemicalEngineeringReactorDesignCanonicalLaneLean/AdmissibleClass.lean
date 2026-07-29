import HautevilleHouse.ChemicalEngineeringReactorDesignCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure AdmissibleClass where
  object : ReactorAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ReactorWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse