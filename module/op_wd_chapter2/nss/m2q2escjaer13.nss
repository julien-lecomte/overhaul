#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LDRUID_CHA") < 99 &&
               CheckIntelligenceLow();
    return iResult;
}
