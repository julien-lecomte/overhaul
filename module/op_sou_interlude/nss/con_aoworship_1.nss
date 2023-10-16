//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check to see if PC has spoken to the
     High Priest and been declared the incarnation
     of God.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: April 9, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_PCISGOD")==10)
        return TRUE;
    return FALSE;
}
