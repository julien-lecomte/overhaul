//::///////////////////////////////////////////////
//:: act_trp_givebrac
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Trip gives the bracers to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    CreateItemOnObject("q2_limitedbracer",oPC);
}
