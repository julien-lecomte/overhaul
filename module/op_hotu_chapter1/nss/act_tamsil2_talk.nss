//::///////////////////////////////////////////////
//:: Name: act_tamsil2_talkpc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set variable that Tamsil has spoken to pc
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Nov 16/02
//:://////////////////////////////////////////////


void main()
{
    SetLocalInt(OBJECT_SELF, "nTalkedToPC", 1);
}
