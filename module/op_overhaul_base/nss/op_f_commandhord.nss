//::///////////////////////////////////////////////
//:: Command the Horde
//:: op_f_commandhord.nss
//:://////////////////////////////////////////////
/*
    Specifics: At 1st level, the Eye of Gruumsh may grant a +2 morale bonus
    on Will saving throws to any allies within 30 feet. The effect lasts
    for 1 hour per eye of Gruumsh level.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    lTarget = GetLocation(oCaster);
    if (GetGender(oCaster) == GENDER_FEMALE)
    {
        ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HOWL_WAR_CRY_FEMALE), lTarget);
    }
    else
    {
        ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HOWL_WAR_CRY), lTarget);
    }

    effect eVis  = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    effect eLink = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_WILL, 2),
                                     EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
    eLink        = ExtraordinaryEffect(eLink);

    nCasterLevel = GetLevelByClass(CLASS_TYPE_EYE_OF_GRUUMSH, oCaster);

    if (nCasterLevel == 0)
    {
        if (DEBUG_LEVEL >= LOG_LEVEL_ERROR) OP_Debug("[ERROR] Command the Horde no class levels in Eye of Gruumsh. Script called in error?");
        return;
    }

    float fDuration = GetDuration(nCasterLevel, HOURS);

    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, TRUE, OBJECT_TYPE_CREATURE);
    while (GetIsObjectValid(oTarget))
    {
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_ALLALLIES))
        {
            SignalSpellCastAt();

            float fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/20;

            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget, fDuration));
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, TRUE, OBJECT_TYPE_CREATURE);
    }
}
