//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Headstone Check (Low Int)
//:: WW1_Hag_Headst_L.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has read their
     headstone already. (Low Int)
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bRead = GetLocalInt(oPC, "CONV_HEADSTONE_Read");
    int bTalked = GetLocalInt(oPC, "CONV_NIGHT_HAG_Headstone");

    if (bRead == TRUE &&
        bTalked == FALSE)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
