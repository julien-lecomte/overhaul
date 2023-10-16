// Action taken for Gishnak: Gnolls agree to fight J'Nah

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
    SetLocalInt(GetModule(), "Q3_GNOLL_HELP", GNOLL_HELP);
    //Turn off encounters
     object oEnc1 = GetObjectByTag("Q3GnollsMixedNormal1");
    object oEnc2 = GetObjectByTag("Q3GnollsMixedNormal2");
    object oEnc3 = GetObjectByTag("Q3GnollsMixedNormal3");
    object oEnc4 = GetObjectByTag("Q3GnollsMixedNormal4");
    object oEnc5 = GetObjectByTag("Q3GnollsMixedNormal5");
    SetEncounterActive(FALSE, oEnc1);
    SetEncounterActive(FALSE, oEnc2);
    SetEncounterActive(FALSE, oEnc3);
    SetEncounterActive(FALSE, oEnc4);
    SetEncounterActive(FALSE, oEnc5);
}
