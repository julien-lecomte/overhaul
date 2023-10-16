//::///////////////////////////////////////////////
//:: con_mw_levelup
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    After the PC levels up
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_LEVELUP")>1;
    return iResult;
}
