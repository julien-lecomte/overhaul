//::///////////////////////////////////////////////
//:: con_hen_inter5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Henchman is on its fifth interjection
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_HENCH_CONV")==50;
    return iResult;
}
