//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC knows Thaddeus.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetModule(),"OS_KILLTYPHUS")>0)
        return TRUE;
    return FALSE;
}
