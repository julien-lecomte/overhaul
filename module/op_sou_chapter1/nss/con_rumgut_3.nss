//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
      Check that PC convinced Rumgut to let Becka go.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On:March 5, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{

    if (GetLocalInt(OBJECT_SELF,"nRumgutGiveUp")==1)
        return TRUE;
    return FALSE;
}
