//::///////////////////////////////////////////////
//:: con_kai_knwtrean
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala knows the treant form
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_KAI_TREANT")==10;
    return iResult;
}
