//::///////////////////////////////////////////////
//:: FileName conv_abl_str_17
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 5/7/2003 11:46:55 PM
//:://////////////////////////////////////////////
int StartingConditional()
{
    if(!(GetAbilityScore(GetPCSpeaker(), ABILITY_STRENGTH) >= 17))
        return FALSE;

    return TRUE;
}
