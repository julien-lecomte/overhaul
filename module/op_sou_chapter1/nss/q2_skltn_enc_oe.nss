//::///////////////////////////////////////////////
//:: Skeleton chasing kobold encounter on-enter
//:: q2_skltn_enc_oe
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Whenever the encounter is triggered - make the kobold run towards the plater, screaming.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 6/2/2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    object oPC = GetEnteringObject();
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);
        // make the player pay attention...
        FloatingTextStrRefOnCreature(40299, oPC);
        object oWP1 = GetWaypointByTag("Q2_WP_KOBOLD_ESCAPE1");
        object oWP2 = GetWaypointByTag("Q2_WP_KOBOLD_ESCAPE2");
        object oWP3 = GetWaypointByTag("Q2_WP_KOBOLD_ESCAPE3");
        object oWP4 = GetWaypointByTag("Q2_WP_KOBOLD_ESCAPE4");

        object oKobold = GetNearestObjectByTag("Q2_ESCAPING_KOBOLD");
        AssignCommand(oKobold, ClearAllActions());
        // run and scream...
        AssignCommand(oKobold, ActionMoveToObject(oWP1, TRUE));
        AssignCommand(oKobold, ActionDoCommand(SetPlotFlag(oKobold, FALSE)));
        AssignCommand(oKobold, ActionSpeakStringByStrRef(40300));
        AssignCommand(oKobold, ActionDoCommand(SetCommandable(TRUE, oKobold)));
        AssignCommand(oKobold, ActionMoveToObject(oWP2, TRUE));
        AssignCommand(oKobold, ActionMoveToObject(oWP3, TRUE));
        AssignCommand(oKobold, ActionMoveToObject(oWP4, TRUE));
        AssignCommand(oKobold, ActionDoCommand(DestroyObject(oKobold)));
        //SetCommandable(FALSE, oKobold);
    }
}
