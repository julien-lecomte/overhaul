//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks how Haniah feels about the PC.

*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"HANIAHLOVE")<20 && GetLocalInt(GetPCSpeaker(),"HANIAHSPEAK")!=0;
    return iResult;
}
