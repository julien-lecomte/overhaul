//::///////////////////////////////////////////////
//:: Name q2b_talk_garg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When one of the gargoyle statues is used,
    start its conversation file
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith warner
//:: Created On:    Dec 10/02
//:://////////////////////////////////////////////

void main()
{
    ActionStartConversation(GetLastUsedBy(), "", TRUE);
}
