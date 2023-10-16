//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if pc met Piper twice already.
*/
//:://////////////////////////////////////////////
//:: Created By:    Dan Whiteside
//:: Created On:    Feb 14, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(),"X1_PIPERSPEAK")==20)
        return TRUE;
    return FALSE;
}
