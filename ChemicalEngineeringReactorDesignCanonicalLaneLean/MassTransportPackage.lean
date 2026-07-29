import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure MassTransportPackage where
  diffusionModel : Prop
  convectionModel : Prop
  filmTheory : Prop
  massTransferCoefficient : Prop

structure MassTransportEvidence (M : MassTransportPackage) where
  diffusionModelClosed : M.diffusionModel
  convectionModelClosed : M.convectionModel
  filmTheoryClosed : M.filmTheory
  massTransferCoefficientClosed : M.massTransferCoefficient

def MassTransportClosed (M : MassTransportPackage) : Prop :=
  M.diffusionModel ∧ M.convectionModel ∧ M.filmTheory ∧ M.massTransferCoefficient

theorem mass_transport_closed_from_evidence
    (M : MassTransportPackage) (E : MassTransportEvidence M) :
    MassTransportClosed M := by
  exact And.intro E.diffusionModelClosed (And.intro E.convectionModelClosed
    (And.intro E.filmTheoryClosed E.massTransferCoefficientClosed))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse