//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check to see if PC has spoken to other worshipers
     and has at least one gift.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 9, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_RIFKINGIFT")==10||
        GetLocalInt(GetPCSpeaker(),"X1_TALISGIFT")==10)
        return TRUE;
    return FALSE;
}
