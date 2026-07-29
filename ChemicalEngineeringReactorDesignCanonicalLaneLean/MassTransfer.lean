import HautevilleHouse.ChemicalEngineeringReactorDesignCanonicalLaneLean.ReactionKinetics

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure MassTransferPackage where
  filmModel : Prop
  diffusionCoefficient : Prop
  massTransferCoefficient : Prop
  concentrationProfile : Prop
  interfaceEquilibrium : Prop

structure MassTransferEvidence (M : MassTransferPackage) where
  filmModelClosed : M.filmModel
  diffusionCoefficientClosed : M.diffusionCoefficient
  massTransferCoefficientClosed : M.massTransferCoefficient
  concentrationProfileClosed : M.concentrationProfile
  interfaceEquilibriumClosed : M.interfaceEquilibrium

def MassTransferClosed (M : MassTransferPackage) : Prop :=
  M.filmModel ∧ M.diffusionCoefficient ∧ M.massTransferCoefficient ∧ M.concentrationProfile ∧ M.interfaceEquilibrium

theorem mass_transfer_closed_from_evidence (M : MassTransferPackage) (E : MassTransferEvidence M) :
    MassTransferClosed M := by
  exact And.intro E.filmModelClosed (And.intro E.diffusionCoefficientClosed (And.intro E.massTransferCoefficientClosed (And.intro E.concentrationProfileClosed E.interfaceEquilibriumClosed)))

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse