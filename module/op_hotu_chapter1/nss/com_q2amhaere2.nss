//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if pc has discovered info about Matron.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On:Oct 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"q2undermountainquest")>= 40;

    return iResult;
}
