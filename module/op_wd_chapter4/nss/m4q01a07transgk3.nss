/// Checks if PC has already hired Vanya and has low int
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M4Q01TRANCAR_HENCH") ==0 &&
              CheckIntelligenceLow();
    return iResult;
}

