#include "NW_I0_PLOT"

int StartingConditional()
{
	return CheckIntelligenceNormal() && GetLocalInt(GetModule(),"M2Q2TerariIsFree") == 0;
}
