import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure HeatTransferPackage where
  energyBalance : Prop
  heatExchangerModel : Prop
  temperatureProfile : Prop
  heatTransferCoefficient : Prop

structure HeatTransferEvidence (H : HeatTransferPackage) where
  energyBalanceClosed : H.energyBalance
  heatExchangerModelClosed : H.heatExchangerModel
  temperatureProfileClosed : H.temperatureProfile
  heatTransferCoefficientClosed : H.heatTransferCoefficient

def HeatTransferClosed (H : HeatTransferPackage) : Prop :=
  H.energyBalance ∧ H.heatExchangerModel ∧ H.temperatureProfile ∧ H.heatTransferCoefficient

theorem heat_transfer_closed_from_evidence
    (H : HeatTransferPackage) (E : HeatTransferEvidence H) :
    HeatTransferClosed H := by
  exact And.intro E.energyBalanceClosed (And.intro E.heatExchangerModelClosed
    (And.intro E.temperatureProfileClosed E.heatTransferCoefficientClosed))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse