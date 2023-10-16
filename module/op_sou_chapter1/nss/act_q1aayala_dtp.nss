//::///////////////////////////////////////////////
//:: Name  act_q1aayala_dtp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ayala will teleport the PC and companions back
    to wherever he/she last died
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 7/03
//:://////////////////////////////////////////////

void main()
{
    //the teleportee
    object oPC = GetPCSpeaker();
    //location to teleport to
    location lTport = GetLocalLocation(oPC, "X1_DEATHPLACE");

    //Special case Death Respawn
    //Underground Ruins - always respawn in middle chamber.
    if (GetTag(GetAreaFromLocation(lTport)) == "Q3_HighForestUndergroundRuins")
        lTport = GetLocation(GetWaypointByTag("wp_q3b_deathrespawn"));

    //teleport effect
    effect ePoof = EffectVisualEffect(VFX_IMP_HEALING_G);

    //PC's current location
    vector vUser = GetPosition(oPC);
    vUser = Vector(vUser.x, vUser.y, vUser.z + 1.0);
    location lUser1 = Location(GetArea(oPC), vUser, 0.0);

    //Target location
    vector vTarget = GetPositionFromLocation(lTport);
    vTarget = Vector(vTarget.x, vTarget.y, vTarget.z + 1.0);
    location lTarget1 = Location(GetAreaFromLocation(lTport), vTarget, 0.0);

    //Have Ayala cast spell on PC
    ActionCastFakeSpellAtObject(SPELL_GREATER_SPELL_BREACH, oPC);

    //Apply teleport effect at current location
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, GetLocation(oPC)));
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lUser1));

    //Apply teleport effect at target location
    DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lTport));
    DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lTarget1));

    // Teleport to last death location...
    DelayCommand(2.5, AssignCommand(oPC, ActionJumpToLocation(lTport)));
}
