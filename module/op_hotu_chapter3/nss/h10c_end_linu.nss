//::///////////////////////////////////////////////
//:: End Narration, Linu Met Halaster (Condition Script)
//:: H10c_End_Linu.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Linu was with the Player
     he/she met Halaster in Ch1.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bFate = GetLocalInt(GetModule(), "bLinuMetHalaster");
    if (bFate == TRUE)
    {
        return TRUE;
    }
    return FALSE;

}
