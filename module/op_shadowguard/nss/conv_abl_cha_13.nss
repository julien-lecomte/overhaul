//::///////////////////////////////////////////////
//:: FileName conv_abl_cha_13
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 5/7/2003 11:46:55 PM
//:://////////////////////////////////////////////
int StartingConditional()
{
    if(!(GetAbilityScore(GetPCSpeaker(), ABILITY_CHARISMA) >= 13))
        return FALSE;

    return TRUE;
}
