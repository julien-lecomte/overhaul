//::///////////////////////////////////////////////
//:: M3Q2D_ZOKANTALKL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Int low and talked to Zoken
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"
int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceLow()
        && GetLocalInt(GetPCSpeaker(),"NW_G_M3Q2D_ZOKANTALK")==1;
    return iResult;
}

