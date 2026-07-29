import HautevilleHouse.ChemicalEngineeringReactorDesignCanonicalLaneLean.MassTransfer

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure ThermodynamicsPackage where
  enthalpyBalance : Prop
  heatTransferCoefficient : Prop
  temperatureProfile : Prop
  heatOfReaction : Prop
  adiabaticOperation : Prop

structure ThermodynamicsEvidence (T : ThermodynamicsPackage) where
  enthalpyBalanceClosed : T.enthalpyBalance
  heatTransferCoefficientClosed : T.heatTransferCoefficient
  temperatureProfileClosed : T.temperatureProfile
  heatOfReactionClosed : T.heatOfReaction
  adiabaticOperationClosed : T.adiabaticOperation

def ThermodynamicsClosed (T : ThermodynamicsPackage) : Prop :=
  T.enthalpyBalance ∧ T.heatTransferCoefficient ∧ T.temperatureProfile ∧ T.heatOfReaction ∧ T.adiabaticOperation

theorem thermodynamics_closed_from_evidence (T : ThermodynamicsPackage) (E : ThermodynamicsEvidence T) :
    ThermodynamicsClosed T := by
  exact And.intro E.enthalpyBalanceClosed (And.intro E.heatTransferCoefficientClosed (And.intro E.temperatureProfileClosed (And.intro E.heatOfReactionClosed E.adiabaticOperationClosed)))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse