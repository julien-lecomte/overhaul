//::///////////////////////////////////////////////
//:: Name q2aseer_spellcast
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On Spell Cast At script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattle2Wave1") != 1)
        return;
    ExecuteScript("nw_c2_defaultb", OBJECT_SELF);
}
