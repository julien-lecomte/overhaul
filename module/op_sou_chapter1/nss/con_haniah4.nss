//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if PC spoke to Haniah before.

*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"HANIAHSPEAK")==10;
    return iResult;
}
