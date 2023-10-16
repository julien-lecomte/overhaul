//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Did someone already ask about Argali's special item?
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "inc_plot_locals"
int StartingConditional()
{
    if (ArgaliAskedAlready(GetPCSpeaker())&& CheckIntelligenceLow())
        return TRUE;
    return FALSE;
}
