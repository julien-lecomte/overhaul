//::///////////////////////////////////////////////
//:: con_check_1000
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check for 1000 gold
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetFirstPC();
    if (GetGold(oPC)>999)
        return TRUE;
    return FALSE;
}
