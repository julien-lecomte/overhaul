//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This initiates dialogue with the shrine being
     used.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 2003
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetLastUsedBy();
    ActionStartConversation(oPC,"q2_shrine_tamose");
}
