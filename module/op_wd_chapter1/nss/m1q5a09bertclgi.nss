#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q5A09Staff")) &&
                     CheckIntelligenceLow();
    return bCondition;
}
