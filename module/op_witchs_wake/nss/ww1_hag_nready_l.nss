//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag Check, Not Ready (Low Int)
//:: WW1_Hag_NReady_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Return TRUE if the player has said they're
    not ready to enter the Plane of Sorrows.
    (Low Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 17, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bNotReady = GetLocalInt(oPC, "CONV_NIGHT_HAG_NotReady");

    if (bNotReady == TRUE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
