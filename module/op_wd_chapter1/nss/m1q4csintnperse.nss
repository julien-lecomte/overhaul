#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceNormal() &&
                AutoDC(DC_EASY, SKILL_PERSUADE, GetPCSpeaker());
	return l_iResult;
}
