// slave starting conditional:
// no gnoll near the slaves

#include "q3_inc_plot"

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

int StartingConditional()
{
    object oGnoll = GetNearestObjectByTag("Q3_GNOLL_JAIL");
    return (oGnoll == OBJECT_INVALID);
}
