#include "NW_I0_Plot"
int StartingConditional()
{
  int l_iResult;

  l_iResult = CheckIntelligenceNormal() &&
              GetLocalInt(GetModule(),"NW_G_PlotAldo") <= 15;
  return l_iResult;
}
