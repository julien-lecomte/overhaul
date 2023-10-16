//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC has shield and int check.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
#include "nw_i0_plot"
int StartingConditional()
{
    object oPC = (GetPCSpeaker());
    if (GetIsObjectValid(GetItemPossessedBy(oPC,"graybansshield"))&& CheckIntelligenceLow())
        return TRUE;
    return FALSE;
}
