//::///////////////////////////////////////////////
//:: act_cal_strtromo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Officially Starts the romance plot with Calibast
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    SetLocalInt(oPC,"OS_CAL_ROMANCE",10);
}
