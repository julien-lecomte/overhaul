//::///////////////////////////////////////////////
//:: Sewer Door On Attacked
//:: 2QE_SEWER_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the door is attacked then the Baram faction
    will go hostile. Also update journal
    accordingly.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 5, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
#include "NW_I0_Generic"
void MobAttack(string sTag);
void main()
{
    object oTarget = GetLastAttacker();
    //if(!GetIsFriend(oTarget))
    //{
        AdjustReputation(GetLastAttacker(), OBJECT_SELF, -100);
        SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
        object oBaram = GetObjectByTag("2Q4E_Baram_02");
        if(GetIsObjectValid(oBaram))
        {
            MobAttack("2Q4E_CurstRogue");
            MobAttack("2Q4E_BaramGhoul");
            SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
            AssignCommand(oBaram, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT));
            effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oBaram);
            DestroyObject(oBaram, 1.0);
            ActionOpenDoor(OBJECT_SELF);
            SetLocalPlotIntOnCharacter(OBJECT_SELF, TRUE);
        }

        int iMainState = GetLocalInt(oTarget, "NW_JOURNAL_ENTRYm2q4_Main");

        if (iMainState < 40)
        {
            AddJournalQuestEntry("m2q4_Main", 50, oTarget);
        }

        if (iMainState == 40)
        {
            AddJournalQuestEntry("m2q4_Main", 60, oTarget);
        }
    //}
}

void MobAttack(string sTag)
{
    object oCritter = GetNearestObjectByTag(sTag);
    int nCnt = 2;

    while(GetIsObjectValid(oCritter) && GetDistanceToObject(oCritter) < 20.0)
    {
        AssignCommand(oCritter, DetermineCombatRound());
        nCnt++;
        oCritter = GetNearestObjectByTag(sTag,OBJECT_SELF, nCnt);
    }
}
