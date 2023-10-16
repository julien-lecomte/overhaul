//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Dynschall votes for PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetFirstPC(),"os_templeguild_pc")==100
        ||GetLocalInt(GetFirstPC(),"os_templeguild_pc")==60)
        return TRUE;
    return FALSE;
}
