//::///////////////////////////////////////////////
//:: Name: q2d_jump_swalk2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump the PC to stonewalk 2's waypoint
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Dec 12/02
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(GetPCSpeaker(), ActionJumpToObject(GetObjectByTag("wp_q2dstonewalk2")));
}
