//::///////////////////////////////////////////////
//:: Charisma Middle
//:: TEMPL_CHM01
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character has a high charisma
    Checks if Peninsula plot done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: March13,2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=3) && (GetLocalInt(OBJECT_SELF,"counter")!=2) && (GetLocalInt(GetModule(),"NW_G_M1Q2MainPlot")==100))
    {
        return CheckCharismaMiddle();
    }
    return FALSE;
}


