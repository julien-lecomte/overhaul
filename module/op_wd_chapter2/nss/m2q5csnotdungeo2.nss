int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_Dungeon") == 0 &&
                GetLocalInt(OBJECT_SELF,"NW_L_DungeonEntrance") == 0;
	return l_iResult;
}
