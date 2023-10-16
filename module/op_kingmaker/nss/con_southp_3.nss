//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if the PC upset Southpaw.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetFirstPC(),"os_southpawmet")==2)
        return TRUE;
    return FALSE;
}
