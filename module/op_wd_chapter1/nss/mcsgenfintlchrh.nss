#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult = GetGender(GetLastSpeaker()) == GENDER_FEMALE &&
                    CheckCharismaHigh() &&
                    CheckIntelligenceLow();
	return l_iResult;
}
