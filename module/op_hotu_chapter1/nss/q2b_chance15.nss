//::///////////////////////////////////////////////
//:: FileName q2b_chance15
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 6/20/2003 2:28:31 PM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Add the randomness
	if(Random(15) >= 1)
		return FALSE;

	return TRUE;
}
