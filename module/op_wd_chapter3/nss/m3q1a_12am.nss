//::///////////////////////////////////////////////
//:: M3Q1A_12AM
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if it's midnight.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetTimeHour()==0)
    {
        return TRUE;
    }
    return FALSE;
}
