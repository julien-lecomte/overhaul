#include "NW_I0_Generic"
void main()
{
    AdjustReputation(GetLastAttacker(),OBJECT_SELF,-100);
    SetEncounterActive(TRUE,GetNearestObjectByTag("ENC_M1Q3AGate"));
    DetermineCombatRound();
}
