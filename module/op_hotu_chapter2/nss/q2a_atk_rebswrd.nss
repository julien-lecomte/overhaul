//::///////////////////////////////////////////////
//:: Default On Attacked
//:: q2a_atk_rebswrd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
    If the Gate is not destroyed - ignore..
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

//#include "nw_i0_generic"

void main()
{
    //Do nothing if in combat already - let the end of round script handle it
    if (GetIsInCombat() == TRUE)
        return;

        object oAttacker = GetLastAttacker();
        // Don't do anything, invalid attacker
        if(GetIsObjectValid(oAttacker)== TRUE)
        {
            //if the front gate isn't down yet - do nothing unless we were damaged
            //by an outsider - this should prevent us rushing the gate when hit by arrows
            if (GetLocalInt(GetModule(), "X2_Q2ABattle1_Gate1Open") == 0)
            {
                if (GetRacialType(oAttacker) != RACIAL_TYPE_OUTSIDER)
                    return;
            }

            ActionAttack(oAttacker);
        }




}
