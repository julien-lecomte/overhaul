//::///////////////////////////////////////////////
//:: os_con_ban_jab1
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Try to start a conversation with Jaboli.
*/
//:://////////////////////////////////////////////
//:: Created By:  Cori
//:: Created On:  Nov 2003
//:://////////////////////////////////////////////
#include "os_inc_banter"

int StartingConditional()
{
    if (TryBanterWith("os_hen_jab", 1) == TRUE)
    {
        return TRUE;
    }
    return FALSE;


}
