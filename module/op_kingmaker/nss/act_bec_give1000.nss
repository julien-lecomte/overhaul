//::///////////////////////////////////////////////
//:: Beckett Bribes PC
//:: act_bec_give1000
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Beckett bribes the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
//give pc 1000 gold, take ring, give some xp
    object oPC = GetFirstPC();
    os_DestroyItem("q2_itm_beckring");
//    object oRing = GetItemPossessedBy(oPC,"q2_itm_beckring");
    GiveGoldToCreature(oPC,1000);
    GiveXPToCreature(oPC,500);
}
