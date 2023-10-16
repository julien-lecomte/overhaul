//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag's Tarot, Passion Condition
//:: WW1_Hag_Passio_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Warlock's Hand local is
     set to 2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iWarlocksHand = GetLocalInt(oPC, "iWarlocksHand");

    if (iWarlocksHand == 2)
    {
        return TRUE;
    }
    return FALSE;
}
