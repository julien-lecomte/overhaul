//::///////////////////////////////////////////////
//:: Insane Ranting
//:: 2Q6H_Insane_E
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the random int that lets the prisoner
    rant and rave.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 1, 2002
//:://////////////////////////////////////////////
#include "NW_I0_HOSTINCL"
int StartingConditional()
{
    int nRand = GetLocalPlotIntFromCharacter(OBJECT_SELF);

    if(nRand == 5)
    {
        return TRUE;
    }
    return FALSE;
}

