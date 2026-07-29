import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure HeatTransferMechanism where
  conductionCoefficient : Type u
  convectionCoefficient : Type v
  heatExchangeArea : Type w
  energyBalance : Prop
  temperatureProfile : Prop
  heatLossToEnvironment : Prop

structure ReactorHeatTransferPackage (H : HeatTransferMechanism) where
  inflowTemperature : Type x
  outflowTemperature : Type y
  coolantTemperature : Type z
  steadyStateHeatBalance : Prop
  transientHeatBalance : Prop
  heatTransferCoefficientClosed : H.conductionCoefficient ∧ H.convectionCoefficient ∧ H.heatExchangeArea

structure ReactorHeatTransferEvidence {H : HeatTransferMechanism} (R : ReactorHeatTransferPackage H) where
  steadyStateHeatBalanceClosed : R.steadyStateHeatBalance
  transientHeatBalanceClosed : R.transientHeatBalance
  heatTransferCoefficientClosed : R.heatTransferCoefficientClosed

def ReactorHeatTransferClosed {H : HeatTransferMechanism} (R : ReactorHeatTransferPackage H) : Prop :=
  R.steadyStateHeatBalance ∧ R.transientHeatBalance ∧ R.heatTransferCoefficientClosed

theorem reactor_heat_transfer_closed_from_evidence {H : HeatTransferMechanism} (R : ReactorHeatTransferPackage H) (E : ReactorHeatTransferEvidence R) : ReactorHeatTransferClosed R := by
  exact And.intro E.steadyStateHeatBalanceClosed (And.intro E.transientHeatBalanceClosed E.heatTransferCoefficientClosed)

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse