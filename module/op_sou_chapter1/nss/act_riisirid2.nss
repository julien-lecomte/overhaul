//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets a local that the henchman answered one
     riddle for the pc.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb. 03, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetPCSpeaker(),"X1_RIISIRIDDLEHELP",10);
}

