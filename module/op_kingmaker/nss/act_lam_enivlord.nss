//::///////////////////////////////////////////////
//:: act_lam_enivlord
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Enivid is lord of the Keep
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////
#include "q_include"
void main()
{
    SetLocalInt(GetModule(),"OS_PC_LORD",60);
    q2_LockCaves();
}
