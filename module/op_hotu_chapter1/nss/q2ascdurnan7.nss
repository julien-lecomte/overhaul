#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"q2undermountainquest")==60&&
                CheckIntelligenceNormal();
    return iResult;
}


