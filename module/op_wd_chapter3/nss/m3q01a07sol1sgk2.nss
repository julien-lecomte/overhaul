int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") == 1;
	return l_iResult;
}
