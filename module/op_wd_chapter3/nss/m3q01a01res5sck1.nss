int StartingConditional()
{
	int l_iResult;

l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_M3Q01TALKRACIST") == 1 && GetLocalInt(OBJECT_SELF,"NW_L_M3Q01TALK5RESPONSE1") != 1;

	return l_iResult;
}

