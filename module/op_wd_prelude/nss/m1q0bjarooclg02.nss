#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M0Q01_MAGE_TEST")  < 2 &&
                     CheckIntelligenceNormal();
    return bCondition;
}
