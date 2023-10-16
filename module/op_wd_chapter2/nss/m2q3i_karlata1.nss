//::///////////////////////////////////////////////
//:: m2q3I Karlat Action Script #1
//:: m2q3I_KarlatA1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a copy of Karlat's Oath for the
    player. It is alright to have multiple copies
    in the world.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    CreateItemOnObject("M2Q3_OATHKARLAT", oPC);
}
