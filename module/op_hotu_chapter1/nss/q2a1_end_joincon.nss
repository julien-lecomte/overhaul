//::///////////////////////////////////////////////
//:: Name q2a1_end_joincon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    After a PC decides to join the council meeting
    or not - the conversation object should destroy
    itself
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 13/02
//:://////////////////////////////////////////////


void main()
{
    DestroyObject(OBJECT_SELF);
}
