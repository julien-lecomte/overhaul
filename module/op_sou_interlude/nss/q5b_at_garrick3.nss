// use a healing potion

void main()
{
    object oPC = GetPCSpeaker();
    object oGarrick = GetNearestObjectByTag("Q5B_GARRICK");

    ActionPauseConversation();

    AssignCommand(oPC, ActionMoveToObject(oGarrick));
    DelayCommand(0.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 1.0)));
    object oItem = GetLocalObject(OBJECT_SELF, "POTION");
    int nStackSize;
    effect eHeal;
    effect eVfx = EffectVisualEffect(VFX_IMP_HEAD_HEAL);
    nStackSize = GetNumStackedItems(oItem);
    if (nStackSize > 1)
    {
        SetItemStackSize(oItem, nStackSize - 1);
    }
    else
    {
        DestroyObject(oItem);
    }
    eHeal = EffectHeal(8);


    effect eLink = EffectLinkEffects(eVfx, eHeal);


    DelayCommand(1.0, SetPlotFlag(oGarrick, FALSE));
    DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oGarrick));
    DelayCommand(3.0, AssignCommand(oGarrick, ClearAllActions()));
    DelayCommand(3.0, AssignCommand(oGarrick, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 0.5, 99999.9)));
    DelayCommand(3.3, AssignCommand(oGarrick, SetFacingPoint(GetPosition(oPC))));
    DelayCommand(3.5, SetPlotFlag(oGarrick, TRUE));
    object oNurse = GetNearestObjectByTag("Q5A_NURSE");
    SetLocalInt(oNurse, "ANIMATED", ANIMATION_LOOPING_MEDITATE);
    object oFocus = GetNearestObjectByTag("FlameLarge");
    SetLocalObject(oNurse, "FOCUS", oFocus);
    AdjustAlignment(oPC, ALIGNMENT_GOOD, 1);
    AssignCommand(oNurse, ClearAllActions());
    object oWP = GetWaypointByTag("Q5B_WP_NURSE_SIT");
    DelayCommand(1.0, AssignCommand(oNurse, ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 0.7)));
    DelayCommand(3.0, PlayVoiceChat(VOICE_CHAT_CHEER, oNurse));
    DelayCommand(2.0, AssignCommand(oNurse, ActionMoveToObject(oWP, FALSE, 0.0)));
    DelayCommand(4.0, AssignCommand(oNurse, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 9999.9)));
    DelayCommand(5.0, AssignCommand(oNurse, ActionDoCommand(SetFacingPoint(GetPosition(oFocus)))));
    DelayCommand(6.0, ActionResumeConversation());

}
