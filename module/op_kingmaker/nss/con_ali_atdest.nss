//::///////////////////////////////////////////////
//:: con_ali_atdest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias has reached her destination
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_ALIAS_ATDEST")==1;
    return iResult;
}
