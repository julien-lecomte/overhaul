#include "NW_I0_PLOT"

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetPCSpeaker(),"Working_For_Baram");
    int iPlot2 = GetLocalInt(GetPCSpeaker(),"Working_For_Kurth");
    if ((iPlot1 == 1) && (iPlot2 == 2))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
