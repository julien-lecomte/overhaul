//::///////////////////////////////////////////////
//:: Animation State on Lever
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 1, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"

void main()
{
    if(!GetMachineState(NW_2Q4_COLMARR_AIR_LEVER))
    {
        SetMachineState(NW_2Q4_COLMARR_AIR_LEVER, TRUE);
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    }
    else
    {
        SetMachineState(NW_2Q4_COLMARR_AIR_LEVER, FALSE);
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    }
}
