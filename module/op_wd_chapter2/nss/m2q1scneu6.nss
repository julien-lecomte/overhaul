// * Geth Alive, Not Cured,  Neurik has ring
int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q1GethIsDead") == 0 && GetLocalInt(GetModule(),"M2Q1GethCured") == 0
                 && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITRING03"));
	return l_iResult;
}
