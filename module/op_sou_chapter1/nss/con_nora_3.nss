//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC has helped Szaren.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 24, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_JOURNAL_ENTRYq1bthay")==50;
    return iResult;
}
