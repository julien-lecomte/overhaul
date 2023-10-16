//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3HeroLC2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set the hero quest local to 2, ending the quest.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 20, 2001
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oSarcophagus = GetObjectByTag("M2Q3MEAGELSARC");

    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_M2Q3HEROQUEST",2);
    AssignCommand(oSarcophagus,ActionUnlockObject(oSarcophagus));
    RewardXP("M2Q3BMaeg",25,GetPCSpeaker());
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DISPEL),GetLocation(OBJECT_SELF));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_PWSTUN),GetLocation(OBJECT_SELF));
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_MaegalSpawn",0);
    DestroyObject(OBJECT_SELF);
}
