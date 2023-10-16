//::///////////////////////////////////////////////
//:: Shadovar (Condition - Random 5 of x - Combat)
//:: C_Shadovar_5ofX.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return TRUE if it's the appropriate
     randomization variable. This is intended for
     use as a combat string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 9, 2003
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

int StartingConditional()
{
    if(GetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION))
    {
        if(!GetIsObjectValid(GetPCSpeaker()))
        {
            int iRandom = GetLocalInt(OBJECT_SELF, "iRandomConv");
            if (iRandom == 5)
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}

