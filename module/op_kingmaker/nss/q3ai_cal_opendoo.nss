//::///////////////////////////////////////////////
//:: Open Door
//:: q3ai_cal_opendoo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens the second door in the cave
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("q3ai_door4");
    SetLocked(oDoor,FALSE);
}
