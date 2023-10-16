//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC spoke to Dead Trip before.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 4, 2001
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    if (GetLocalInt(GetFirstPC(),"OS_SPOKETOTRIPDEAD")==0)
        return TRUE;
    return FALSE;
}
