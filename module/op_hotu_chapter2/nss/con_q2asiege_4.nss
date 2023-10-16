//::///////////////////////////////////////////////
//:: Name con_q2asiege_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test to see if the Matron DOES NOT have Beholders
    in her army
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "x2_plot_beholders_out") > 0)
        return TRUE;
    return FALSE;
}
