//::///////////////////////////////////////////////
//:: Heavy Flail Check
//:: q3ai_mw_hflail
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the player can use the heavy flail
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "q_include"
int StartingConditional()
{
    int iResult;

    iResult = os_CheckMW(OS_MW_HEAVYFLAIL);
    return iResult;
}
