#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q04IAUCTION")) == TRUE;
	return l_iResult;
}
