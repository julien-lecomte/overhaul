// speaker has low INT and knows about the competition

#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckIntelligenceLow() &&
                GetLocalInt(GetPCSpeaker(),"NW_L_M2Q5KnowContest") != 0;
    return l_iResult;
}
