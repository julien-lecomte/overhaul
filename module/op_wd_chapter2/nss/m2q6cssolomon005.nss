#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckCharismaHigh() &&
              GetIsObjectValid(GetPCSpeaker()) &&
              GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") == 0;
    return iResult;
}
