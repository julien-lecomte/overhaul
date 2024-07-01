//::///////////////////////////////////////////////
//:: Ability Damage spells
//:: op_s_abilitydama.nss
//:://////////////////////////////////////////////
/*
    Spells that just decrease ability scores.

    Feeblemind
    The caster does 1d4 points of Intelligence damage to the creature for every
    4 caster levels. The effect is supernatural and can only be removed by Heal
    or Greater Restoration.

*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eLink;
    int nBeam = VFX_NONE, nVis = VFX_NONE;
    float fDuration = 0.0;
    int nDurationType = DURATION_TYPE_TEMPORARY;
    int nTouchType = TOUCH_NONE;
    int nImmunityType = IMMUNITY_TYPE_NONE;
    int nSavingThrow = -1, nSavingThrowType = SAVING_THROW_TYPE_NONE;

    switch (nSpellId)
    {
        case SPELL_FEEBLEMIND:
        {
            nImmunityType = IMMUNITY_TYPE_MIND_SPELLS;
            nSavingThrow = SAVING_THROW_WILL;
            nSavingThrowType = SAVING_THROW_TYPE_MIND_SPELLS;
            nVis = VFX_IMP_REDUCE_ABILITY_SCORE;
            nBeam = VFX_BEAM_MIND;
            int nDamage = GetDiceRoll(max(1, nCasterLevel/4), 4);
            eLink = EffectLinkEffects(EffectAbilityDecrease(ABILITY_INTELLIGENCE, nDamage),
                                      EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));

            // Supernatural effect
            eLink = SupernaturalEffect(eLink);

            fDuration = GetDuration(nCasterLevel / 2, ROUNDS);
        }
        break;
        default:
            OP_Debug("[Ability Damage] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        break;
    }

    // Touch attack
    int nTouchAttack = DoTouchAttack(oTarget, oCaster, nTouchType);

    // Beam regardless of attitude
    if (nBeam) ApplyBeamToObject(nBeam, oTarget, !nTouchAttack);

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        if (nTouchAttack)
        {
            if (!DoResistSpell(oTarget, oCaster))
            {
                // Since some effects may have a different immunity check...
                if (!GetIsImmuneWithFeedback(oTarget, nImmunityType, oCaster))
                {
                    if (nSavingThrow == -1 || !DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType))
                    {
                        ApplyVisualEffectToObject(nVis, oTarget);
                        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                    }
                }
                else
                {
                    // VFX still applies with feedback message
                    ApplyVisualEffectToObject(nVis, oTarget);
                }
            }
        }
    }
}

