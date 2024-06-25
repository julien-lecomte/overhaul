//::///////////////////////////////////////////////
//:: Domination Spells
//:: op_s_dominate
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // For now all the spells in this script are single target so we just alter
    // the domination effect depending on the target.
    effect eControl = GetScaledEffect(EffectDominated(), oTarget);

    // We check for mind immunity and dominate immunity as part of the checks
    // so we want this to ignore immunity to Daze if it's targeting a PC.
    // TODO: Do we replace the effect icon with "Dominated (Dazed)" or similar?
    eControl = IgnoreEffectImmunity(eControl);

    effect eLink = EffectLinkEffects(eControl,
                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DOMINATED),
                                     EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

    effect eVis = EffectVisualEffect(VFX_IMP_DOMINATE_S);

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        float fDuration;

        // Validate target, plus durations
        switch (nSpellId)
        {
            case SPELL_DOMINATE_PERSON:
            {
                if (!GetIsHumanoidCreature(oTarget)) return;

                fDuration = GetDuration(2 + (nCasterLevel/3), ROUNDS);
            }
            break;
            case SPELL_DOMINATE_ANIMAL:
            {
                if (GetRacialType(oTarget) != RACIAL_TYPE_ANIMAL) return;

                fDuration = GetDuration(3 + nCasterLevel, ROUNDS);
            }
            break;
            case SPELL_DOMINATE_MONSTER: fDuration = GetDuration(3 + nCasterLevel, MINUTES); break;
            case SPELL_CONTROL_UNDEAD:
            {
                if (GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD || GetHitDice(oTarget) > nCasterLevel * 2) return;

                fDuration = GetDuration(nCasterLevel, HOURS);
            }
            break;
            default:
            {
                OP_Debug("[op_s_dominate] Unknown spell ID: " + IntToString(nSpellId), LOG_LEVEL_ERROR);
                return;
            }
            break;
        }
        SpeakString("fDuration = " + FloatToString(fDuration));

        if (!DoResistSpell(oTarget, oCaster))
        {
            int nSaveType = nSpellId == SPELL_CONTROL_UNDEAD ? SAVING_THROW_TYPE_NONE : SAVING_THROW_TYPE_MIND_SPELLS;

            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, nSaveType))
            {
                // Check immunities - noting Control Undead ignores these
                if (nSpellId == SPELL_CONTROL_UNDEAD ||
                   (!GetIsImmuneWithFeedback(oTarget, IMMUNITY_TYPE_DOMINATE, oCaster) &&
                    !GetIsImmuneWithFeedback(oTarget, IMMUNITY_TYPE_MIND_SPELLS, oCaster)))
                {
                    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                }
            }
        }
    }
}

