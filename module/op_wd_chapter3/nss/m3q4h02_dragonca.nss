//::///////////////////////////////////////////////
//:: M3Q4H02_DragonCa.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Awakes a sleeping dragon.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "m3plotinclude"
void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        SleepingDragonAwoken();
    }
}
