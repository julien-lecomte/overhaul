//::///////////////////////////////////////////////
//:: kobold trap On Enter
//:: q2_aoe_trap_oe
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Those within the area of effect must make a
    fortitude save or be dazed. A pc with a protective helmet is unaffected
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 3/2/2003
//:://////////////////////////////////////////////

#include "NW_I0_SPELLS"
void main()
{
    //Declare major variables
    effect eStink = EffectDazed();
    effect eMind = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink = EffectLinkEffects(eMind, eStink);
    eLink = EffectLinkEffects(eLink, eDur);

    effect eVis = EffectVisualEffect(VFX_IMP_DAZED_S);
    effect eFind;
    object oTarget;
    object oCreator;
    float fDelay;
    //Get the first object in the persistant area
    oTarget = GetEnteringObject();
    if (GetIsDM(oTarget) == FALSE)
    {
        // Checking if player has the protective helmet equiped
        object oHelmet = GetItemInSlot(INVENTORY_SLOT_HEAD, oTarget);
        if(oHelmet != OBJECT_INVALID && GetTag(oHelmet) == "Q2_PROTECTIVE_HELMET")
            return;

        //Make a Fort Save
        if(!MySavingThrow(SAVING_THROW_FORT, oTarget, 18, SAVING_THROW_TYPE_POISON))
        {
            fDelay = GetRandomDelay(0.75, 1.75);
            //Apply the VFX impact and linked effects
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(2)));
        }
    }
}
