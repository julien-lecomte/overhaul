#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult =
    CheckIntelligenceNormal()
    &&
    GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q05IGOBHEAD")) == TRUE;
    return l_iResult;
}

