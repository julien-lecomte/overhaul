//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks a local to see if PC answered the bonus
     riddle correctly.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb. 03, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_RIISIBONUS")==0 && CheckIntelligenceLow())
        return TRUE;
    return FALSE;
}
