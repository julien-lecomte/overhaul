//::///////////////////////////////////////////////
//:: con_kai_shifted
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala has shifted to a new shape
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_KAI_SHAPE")==10;
    return iResult;
}
