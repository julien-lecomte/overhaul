//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Feran is in his office.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept. 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF,"OS_FERANATBAR")==0)
        return TRUE;
    return FALSE;
}
