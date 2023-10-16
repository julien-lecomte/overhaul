//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q3cs_Lerk001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC can try to persuade Lerk to open the
    gate to Wanev's tower only once.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 4, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetLocalInt(OBJECT_SELF,"NW_L_Persuade") == 0;
    return iResult;
}
