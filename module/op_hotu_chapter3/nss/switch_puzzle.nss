//////////////////////////////////////////////////////////////////////////////////
// This script is for the levers that the PC will be pulling to get across the lava
// pool. We want the same result whether they are activating or deactivating the
// switches, but we want the appropriate animation to play.
//
// Created by: Brad Prince
// 9-13-02
//
///////////////////////////////////////////////////////////////////////////////////
// Jump PC and associates.
void AllJumpToLocation(object oObject, location lLoc);
void main()
{
   object oPC = GetLastUsedBy();
   // The destination is stored here.  It can change every heartbeat according
   // to which way the arrow is pointing.
   location lDest = GetLocalLocation(OBJECT_SELF, "destination");
   int iPulled = GetLocalInt(OBJECT_SELF, "pulled");

   if(iPulled == 0) {
      SetLocalInt(OBJECT_SELF, "pulled", 1);
      ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
      DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_INSTANT,
                   EffectVisualEffect(VFX_IMP_HARM), oPC));
      DelayCommand(2.5, AllJumpToLocation(oPC, lDest));
   }
   else {
      SetLocalInt(OBJECT_SELF, "pulled", 0);
      ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
      DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_INSTANT,
                   EffectVisualEffect(VFX_IMP_HARM), oPC));
      DelayCommand(2.5, AllJumpToLocation(oPC, lDest));
   }
}

// Jump PC and associates.
void AllJumpToLocation(object oObject, location lLoc)
{
    object oHench1 = GetHenchman(oObject, 1);
    object oHench2 = GetHenchman(oObject, 2);
    object oHench3 = GetHenchman(oObject, 3);
    object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
    object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
    object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
    object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

    AssignCommand(oObject, ClearAllActions());
    AssignCommand(oObject, ActionJumpToLocation(lLoc));

    if(GetIsObjectValid(oHench1))
    {
        AssignCommand(oHench1, ClearAllActions());
        AssignCommand(oHench1, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oHench2))
    {
        AssignCommand(oHench2, ClearAllActions());
        AssignCommand(oHench2, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oHench3))
    {
        AssignCommand(oHench3, ClearAllActions());
        AssignCommand(oHench3, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc1))
    {
        AssignCommand(oAssoc1, ClearAllActions());
        AssignCommand(oAssoc1, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc2))
    {
        AssignCommand(oAssoc2, ClearAllActions());
        AssignCommand(oAssoc2, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc3))
    {
        AssignCommand(oAssoc3, ClearAllActions());
        AssignCommand(oAssoc3, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc4))
    {
        AssignCommand(oAssoc4, ClearAllActions());
        AssignCommand(oAssoc4, ActionJumpToLocation(lLoc));
    }
}
