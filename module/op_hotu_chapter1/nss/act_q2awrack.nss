//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Initiates dialogue allowing the player to
     attempt to steal an item from the weapon rack.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetLastUsedBy();
    ActionStartConversation(oPC,"q2awrack");
}
