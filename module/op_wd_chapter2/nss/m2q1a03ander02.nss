// if the player knows Ander met a werewolf, Int low

#include "NW_I0_PLOT"
int StartingConditional()
{
    int iStory = GetLocalInt(GetPCSpeaker(),"Knows_Ander_Story");
    if (iStory == 1)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
