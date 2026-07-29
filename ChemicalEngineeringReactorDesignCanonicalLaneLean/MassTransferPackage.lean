import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure MassTransferCoefficient where
  fluidPhase : Type u
  filmThickness : Type v
  diffusivity : Type w
  sherwoodCorrelation : Prop
  convectiveTransfer : Prop

structure MassTransferPackage (M : MassTransferCoefficient) where
  bulkConcentration : Type x
  interfaceConcentration : Type y
  massTransferFlux : Prop
  equilibriumLinearity : Prop
  massTransferCoefficientClosed : M.sherwoodCorrelation ∧ M.convectiveTransfer

structure MassTransferEvidence {M : MassTransferCoefficient} (P : MassTransferPackage M) where
  massTransferFluxClosed : P.massTransferFlux
  equilibriumLinearityClosed : P.equilibriumLinearity
  massTransferCoefficientClosed : P.massTransferCoefficientClosed

def MassTransferClosed {M : MassTransferCoefficient} (P : MassTransferPackage M) : Prop :=
  P.massTransferFlux ∧ P.equilibriumLinearity ∧ P.massTransferCoefficientClosed

theorem mass_transfer_closed_from_evidence {M : MassTransferCoefficient} (P : MassTransferPackage M) (E : MassTransferEvidence P) : MassTransferClosed P := by
  exact And.intro E.massTransferFluxClosed (And.intro E.equilibriumLinearityClosed E.massTransferCoefficientClosed)

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse