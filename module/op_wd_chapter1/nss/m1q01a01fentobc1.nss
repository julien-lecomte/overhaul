//// Check if PC has normal int and Note 1

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q1_LetterConspiracy"));;
    return iResult;
}
