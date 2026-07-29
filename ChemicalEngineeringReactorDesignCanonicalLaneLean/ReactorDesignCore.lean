import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure ReactorModel where
  reactorType : String  -- "CSTR", "PFR", "Batch"
  volume : Float
  inletTemperature : Float
  inletConcentrations : List Float
  reactionNetwork : ReactionRatePackage
  energyBalance : Prop
  massBalanceClosed : Prop

structure ReactorModelEvidence (R : ReactorModel) where
  energyBalanceClosed : R.energyBalance
  massBalanceClosedClosed : R.massBalanceClosed

def ReactorModelClosed (R : ReactorModel) : Prop :=
  R.energyBalance ∧ R.massBalanceClosed

theorem reactor_model_closed_from_evidence (R : ReactorModel)
    (E : ReactorModelEvidence R) : ReactorModelClosed R := by
  exact And.intro E.energyBalanceClosed E.massBalanceClosedClosed

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse