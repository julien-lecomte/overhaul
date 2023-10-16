//::///////////////////////////////////////////////
//:: con_grd_alljobs
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All jobs are open
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_THEGORD_DWARF")<20
        && GetLocalInt(GetModule(), "OS_THEGORD_COWS")<20
        && GetLocalInt(GetModule(), "OS_THEGORD_ARCH")<20;
    return iResult;
}
