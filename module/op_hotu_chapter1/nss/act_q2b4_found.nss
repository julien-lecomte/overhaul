//::///////////////////////////////////////////////
//:: Name act_q2b4_found
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set the search variable for the throne of bone
    to mark it as found
*/
//:://////////////////////////////////////////////
//:: Created By:   Keith Warner
//:: Created On:   Dec 10/02
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "nQ2B4ThroneFound", 1);
}
