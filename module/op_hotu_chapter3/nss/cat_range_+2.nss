//::///////////////////////////////////////////////
//:: Catapult: Range Adjustment +2
//:: Cat_Range_+2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Adjust the catapult's range by +2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iRange = GetLocalInt(oPC, "iRange");
    iRange = iRange + 2;
    SetLocalInt(oPC, "iRange", iRange);
    SetLocalInt(oPC, "bDefaultRange", TRUE);
}
