#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetGender(GetPCSpeaker()) == GENDER_FEMALE &&
                     CheckIntelligenceLow();
    return bCondition;
}

