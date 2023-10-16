//::///////////////////////////////////////////////
//:: M3Q1A_2AM
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if it's 2 a.m.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetTimeHour()==2)
    {
        return TRUE;
    }
    return FALSE;
}
