//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6RitualLC2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set the Aribeth ritual local to 2.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 16, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_Ritual",2);
}
