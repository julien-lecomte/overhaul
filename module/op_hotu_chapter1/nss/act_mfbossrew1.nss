//::///////////////////////////////////////////////
//:: FileName act_mfbossrew1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/16/2002 4:11:37 PM
//:://////////////////////////////////////////////
void main()
{
    // Give the speaker some XP
    GiveXPToCreature(GetPCSpeaker(), 250);

    // Give the speaker the items
    CreateItemOnObject("confusiontoy", GetPCSpeaker(), 1);

}
