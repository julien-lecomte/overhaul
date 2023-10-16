// this is the on enter script if a trigger that encompasses the NPC who will be
//initiating dialouge. Make sure to replace the value of sTag with the tag of
//the NPC in question.
void main()
{
    string sTag = "Insert_Tag_Here";
    object oNPC = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_" + sTag);
    object oPC = GetEnteringObject();
    if(GetIsPC(oPC) &&
       GetLocalInt(oPC,"NW_L_Init_" + GetTag(oNPC)) == FALSE &&
       IsInConversation(oNPC) == FALSE)
    {
        AssignCommand(oPC,ClearAllActions());
        AssignCommand(oNPC,ClearAllActions());
        AssignCommand(oNPC,ActionStartConversation(oPC));
    }
}
