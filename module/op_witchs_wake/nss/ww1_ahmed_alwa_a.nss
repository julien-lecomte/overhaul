//::///////////////////////////////////////////////
//:: Witchwork 1: Ahmed, Set "Always" Local
//:: WW1_Ahmed_Hate_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set Ahmed's "Always" local on the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Septemeber 27, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "CONV_AHMED_Always", TRUE);
}
