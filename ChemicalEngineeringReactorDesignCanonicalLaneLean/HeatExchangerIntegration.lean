import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure HeatExchangerIntegrationModel where
  hotStreamInlet : Prop
  coldStreamInlet : Prop
  heatTransferCoefficient : Prop
  temperatureProfile : Prop
  energyBalance : Prop

structure HeatExchangerIntegrationEvidence (M : HeatExchangerIntegrationModel) where
  hotStreamInletClosed : M.hotStreamInlet
  coldStreamInletClosed : M.coldStreamInlet
  heatTransferCoefficientClosed : M.heatTransferCoefficient
  temperatureProfileClosed : M.temperatureProfile
  energyBalanceClosed : M.energyBalance

def HeatExchangerIntegrationClosed (M : HeatExchangerIntegrationModel) : Prop :=
  M.hotStreamInlet ∧ M.coldStreamInlet ∧ M.heatTransferCoefficient ∧ M.temperatureProfile ∧ M.energyBalance

theorem heat_exchanger_integration_closed_from_evidence
    (M : HeatExchangerIntegrationModel) (E : HeatExchangerIntegrationEvidence M) :
    HeatExchangerIntegrationClosed M := by
  exact And.intro E.hotStreamInletClosed
    (And.intro E.coldStreamInletClosed
      (And.intro E.heatTransferCoefficientClosed
        (And.intro E.temperatureProfileClosed E.energyBalanceClosed)))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse