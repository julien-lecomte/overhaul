// if the player knows Ander met a werewolf, Int normal

#include "NW_I0_PLOT"
int StartingConditional()
{
    int iStory = GetLocalInt(GetPCSpeaker(),"Knows_Ander_Story");
    if (iStory == 1)
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
