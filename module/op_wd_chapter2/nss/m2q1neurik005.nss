//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q1NEURIK005
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes sure the PC can only ask about the
    portal once.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: February 25, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetPCSpeaker(),"NW_L_AskNeurikPortal",10);
}
