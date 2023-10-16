//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Morrius Spoke of Trust (Normal Int)
//:: WW1_Morr_Trust_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Morrius' "Trust" local
     has been set on the player. (Normal Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 10, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bTrust = GetLocalInt(oPC, "CONV_MORRIUS_Trust");

    if (bTrust == TRUE)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
