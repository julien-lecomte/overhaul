//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Does pc have 200 gold?
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 13, 2003.
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    if ((GetGold(GetPCSpeaker())>=200) && CheckIntelligenceLow())
        return TRUE;
    return FALSE;
}
