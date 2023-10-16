//::///////////////////////////////////////////////
//:: Name q6_endcon_deekin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    if "q6_Deekin_Job" == 0 - so if Deekin hasn't
    said enough yet - reinit with the PC...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 5/03
//:://////////////////////////////////////////////
#include "x0_i0_common"

void CheckForInterjection(object oPC, int nEventNum);
void DoInterjection(object oHench, object oPC, int MOD_EVENT_NUMBER);
int ValidForInterjection(object oPC, object oHench);
void StartTalking(object oTalker, object oTalkTo);

void main()
{
    object oPC = GetPCSpeaker();
    object oDeekin = OBJECT_SELF;


    if (GetLocalInt(OBJECT_SELF, "q6_All_Done") == 1)
    {
        ActionMoveAwayFromObject(oPC, TRUE);
        SetCommandable(FALSE);
        DestroyObject(OBJECT_SELF, 5.0);
        return;
    }
    if (GetLocalInt(oPC,"q6_Deekin_Job") == 0)
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(0.5, StartTalking(oDeekin, oPC));
    }
    else if (GetLocalInt(OBJECT_SELF, "nJumpedOnce") == 0)
    {
        if (GetLocalInt(GetModule(), "X1_DeekinSpawnAtShop") != 2)
        {
            SetLocalInt(OBJECT_SELF, "nJumpedOnce", 1);
            SpeakStringByStrRef(40271);
            ActionMoveAwayFromObject(GetPCSpeaker(), TRUE);
            DelayCommand(3.0, JumpToObject(GetWaypointByTag("wp_q6a_deekin_shop_spn")));
            //The first time the PC finishes talking to Deekin, check for a henchman interjection.
            DelayCommand(1.0, CheckForInterjection(oPC, 11));
        }
        else
        {
            SetLocalInt(OBJECT_SELF, "nJumpedOnce", 1);
            ActionMoveToObject(GetWaypointByTag("wp_q6a_deekin_shop_spn"));
        }
    }

}
void StartTalking(object oTalker, object oTalkTo)
{
    if (IsInConversation(oTalker) == FALSE && IsInConversation(oTalkTo) == FALSE)
        AssignCommand(oTalker, ActionStartConversation(oTalkTo));
}
void DoInterjection(object oHench, object oPC, int MOD_EVENT_NUMBER)
{
        AssignCommand(oHench, SetHasInterjection(oPC, TRUE, MOD_EVENT_NUMBER));
        AssignCommand(oHench, ClearAllActions());
        AssignCommand(oPC, ClearAllActions());
//        AssignCommand(oHench, ActionMoveToObject(oPC, TRUE, 6.0));
        AssignCommand(oHench, ActionStartConversation(oPC));
}
// * am I valid for doing an interjection
int ValidForInterjection(object oPC, object oHench)
{
    if (!IsInConversation(oPC)
        && GetDistanceBetweenLocations(GetLocation(oPC), GetLocation(oHench)) <= 20.0)
    {
        return TRUE;
    }
    return FALSE;
}
void CheckForInterjection(object oPC, int nEventNum)
{
    // * choose which henchmen gets to interject

    object oDeekin = GetObjectByTag("x0_hen_dee");
    object oDorna = GetObjectByTag("x0_hen_dor");
    object oXanos = GetObjectByTag("x0_hen_xan");
    object oHench = OBJECT_INVALID;
    object oMaster = OBJECT_INVALID;

    int bFoundAHench = FALSE;
    if (GetIsObjectValid(oDorna) && bFoundAHench == FALSE)
    {
        oMaster = GetMaster(oDorna);
        if (GetIsObjectValid(oMaster))
        {
            oHench = oDorna;
            bFoundAHench = TRUE;
        }
    }
    if (GetIsObjectValid(oXanos) && bFoundAHench == FALSE)
    {
        oMaster = GetMaster(oXanos);
        if (GetIsObjectValid(oMaster))
        {
            oHench = oXanos;
            bFoundAHench = TRUE;
        }
    }

    //SpawnScriptDebugger();
    // The key tag of the trigger is the module event number
    int MOD_EVENT_NUMBER = nEventNum;

    string sHenchTag = GetTag(oHench);
    if (ValidForInterjection(oMaster, oHench) && ValidForInterjection(oHench, oMaster))
    {
        // interjections
        DoInterjection(oHench, oMaster, MOD_EVENT_NUMBER);
            // Only signal once
    }
}
