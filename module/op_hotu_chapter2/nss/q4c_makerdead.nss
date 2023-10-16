//::///////////////////////////////////////////////
//:: q4c_makerdead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Checks if the Maker is dead
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetObjectByTag("q4d_maker"));
    return iResult;
}
