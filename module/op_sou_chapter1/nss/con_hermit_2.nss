//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check and make sure PC has 500 gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetGold(GetPCSpeaker())>499)
        return TRUE;
    return FALSE;
}
