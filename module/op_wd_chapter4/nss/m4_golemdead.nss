//::///////////////////////////////////////////////
//:: M4_GOLEMDEAD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rewards player for killing golems.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 22, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_GOLEMREWARD") == 0)
    {
        SetLocalInt(OBJECT_SELF, "NW_L_GOLEMREWARD", 1);
        RewardXP("M4Q01_SIEGE",25,GetPCSpeaker());
    }
    SetLocalInt(OBJECT_SELF,"NW_G_M4GOLEM",1);
}
