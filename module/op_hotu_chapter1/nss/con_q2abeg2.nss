//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Remembers that PC was rude to beggar.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov. 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
int StartingConditional()
{
    int iResult;

    iResult = PCIsColdHeartedJerk(GetPCSpeaker());
    return iResult;
}
