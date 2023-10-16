//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc has met Levio'Sa before.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 3, 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    if (os_CheckTalkedTo(0))
        return TRUE;
    return FALSE;
}
