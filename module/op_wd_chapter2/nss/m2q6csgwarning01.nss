int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_Timer1") == 0 &&
                !GetIsObjectValid(GetPCSpeaker());
	return l_iResult;
}
