int StartingConditional()
{
	int l_iResult;

	l_iResult = GetIsObjectValid(GetObjectByTag("M2Q06COGRETORT")) &&
                GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") == 0;
	return l_iResult;
}
