//::///////////////////////////////////////////////
//:: M4_NURSING
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the NPC back to nursing after talking.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 12, 2002
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    SetLocalInt(OBJECT_SELF, "NW_M4_NURSE", FALSE);
//    WalkWayPoints();
}
