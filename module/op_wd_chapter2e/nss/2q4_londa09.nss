// Baram has mentioned Londa's children

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"Londa_Plot");
    if (iPlot == 10)
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
