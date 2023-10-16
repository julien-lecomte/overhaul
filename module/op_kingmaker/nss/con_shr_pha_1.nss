//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC is a follower of this god.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetFirstPC(),"os_pcbelieves")==10)
        return TRUE;
    return FALSE;
}
