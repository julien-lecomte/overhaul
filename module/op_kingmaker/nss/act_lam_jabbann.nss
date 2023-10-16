//::///////////////////////////////////////////////
//:: Jaboli Banner
//:: act_lam_jabbann
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC makes Jaboli the Banner and Enivid the Hand
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oBeck = GetObjectByTag("q2_sirbecket");
    if(GetLocalInt(oBeck,"OS_BECKET_BANNER")==10)
    {
        SetLocalInt(oBeck,"OS_BECKET_BANNER",99);
    }
    SetLocalInt(oPC,"OS_BANNER",30);
    SetLocalInt(oPC,"OS_HAND",20);
}
