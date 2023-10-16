//::///////////////////////////////////////////////
//:: Witchwork Conversation System: Kinship, Normal Int
//:: WW_Abil_Kin_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is of the same
    racial type as the NPC and of normal
    Intelligence.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Sept 3, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iPCRace = GetRacialType(oPC);
    int iNPCRace = GetRacialType(OBJECT_SELF);

    if (iPCRace == iNPCRace)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
