#include "hx_inc_appear"
// Check for alpha wolf.
int StartingConditional()
{
    if(GetTag(OBJECT_SELF) == "hx_winter_wolf_a" && GetLocalInt(GetModule(), "HX_WOLF_QUEST") == 3
       && CheckWolfQuest(GetPCSpeaker()) == TRUE)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
