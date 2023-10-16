//::///////////////////////////////////////////////
//:: Elly forgives Feran
//:: act_fer_ellyfrgv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Ellysia forgives Feran
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
//give xp, set military guild voting for PC
    object oPC = GetFirstPC();
    if(GetLocalInt(oPC,"OS_MILITARYGUILD")!=10)
    {
        object oEnivid = GetObjectByTag("q2_enivid");
        int nEnivid = GetLocalInt(GetModule(), "OS_ENIVID_VOTES")-1;
        SetLocalInt(GetModule(), "OS_ENIVID_VOTES",nEnivid);

        os_FirstVote();
        int nVote = GetLocalInt(oPC,"OS_PC_VOTES")+1;
        SetLocalInt(oPC,"OS_PC_VOTES",nVote);
        //FloatingTextStringOnCreature("PC Votes: "+ IntToString(nVote),oPC);
        SetLocalInt(oPC,"OS_MILITARYGUILD",10);
    }
    if(os_GetXPReceived())
    {
        GiveXPToCreature(oPC,750);
        os_SetXPReceived();
    }
}
