int StartingConditional()
{
	int l_iResult;

	l_iResult =GetLocalInt(GetModule(),"NW_G_M1G5MainPlot") == 100;

	return l_iResult;
}
