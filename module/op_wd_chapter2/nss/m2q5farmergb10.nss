//::///////////////////////////////////////////////
//::
//:: Conversation
//::
//:: M2Q5FarmerGB10.NSS
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: Set a local when the Farmer's wife has been mentioned.
//::
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: September 25, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"NW_G_M2Q5WifeMentioned",10);
}
