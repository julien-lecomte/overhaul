//::///////////////////////////////////////////////
//:: FileName q3a_sc_gong1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/4/2003 10:10:06 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Perform skill checks
	if(!(AutoDC(DC_HARD, SKILL_LORE, GetPCSpeaker())))
		return FALSE;

	return TRUE;
}
