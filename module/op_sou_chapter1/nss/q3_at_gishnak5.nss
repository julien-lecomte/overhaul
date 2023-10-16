// Action taken for Gishnak: chief gives key to player

/*
values for Q3_GNOLL_STATUS:

GNOLL_STATUS_INIT =             initial status
GNOLL_STATUS_LEFT =             all gnoll left the area
GNOLL_STATUS_DEAD =             chief is dead
GNOLL_STATUS_SAFE_PASSAGE =     gnollsgave safe passge
GNOLL_STATUS_CONTROL_TRIBE =     player has full control over the tribe

values for Q3_GNOLL_HELP

GNOLL_NOHELP
GNOLL_HELP
*/

#include "q3_inc_plot"

void main()
{
    object oPC = GetPCSpeaker();
    object oKey = GetItemPossessedBy(OBJECT_SELF, "Q3_KEY_CHIEF");
    ActionGiveItem(oKey, oPC);
}
