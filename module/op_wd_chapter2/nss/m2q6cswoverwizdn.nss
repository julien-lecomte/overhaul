#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckIntelligenceNormal() &&
                GetLocalInt(GetModule(),"NW_G_OverwizardWestDead") == 10;
    return l_iResult;
}
