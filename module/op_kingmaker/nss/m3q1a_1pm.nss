//::///////////////////////////////////////////////
//:: M3Q1A_1PM
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if it's 1 p.m.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetTimeHour()==13)
    {
        return TRUE;
    }
    return FALSE;
}
