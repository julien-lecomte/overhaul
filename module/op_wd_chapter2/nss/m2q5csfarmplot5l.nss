#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = //GetLocalInt(GetModule(), "NW_G_M2Q05PLOTDERG") == 10 &&
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "M2Q5DERGIABHEAD")) &&
                CheckIntelligenceLow();
    return l_iResult;
}
