int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_FindMark") == 40 &&
                GetPCSpeaker() == OBJECT_INVALID;
	return l_iResult;
}
