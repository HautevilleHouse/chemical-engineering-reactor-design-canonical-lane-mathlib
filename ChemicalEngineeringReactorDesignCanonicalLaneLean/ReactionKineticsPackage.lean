import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringReactorDesignCanonicalLaneLean

structure ReactionKineticsPackage where
  reactionMechanism : Type u
  rateConstants : Type v
  rateLaw : Prop
  arrheniusRelation : Prop
  reactionOrder : Prop

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  rateLawClosed : R.rateLaw
  arrheniusRelationClosed : R.arrheniusRelation
  reactionOrderClosed : R.reactionOrder

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  R.rateLaw ∧ R.arrheniusRelation ∧ R.reactionOrder

theorem reaction_kinetics_closed_from_evidence
    (R : ReactionKineticsPackage) (E : ReactionKineticsEvidence R) :
    ReactionKineticsClosed R := by
  exact And.intro E.rateLawClosed (And.intro E.arrheniusRelationClosed E.reactionOrderClosed)

end ChemicalEngineeringReactorDesignCanonicalLaneLean
end HautevilleHouse