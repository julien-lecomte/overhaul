//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give PC 100 xp,
     Mark Thaddeus not voting for PC
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
void main()
{
    GiveXPToCreature(GetFirstPC(),100);
    SetLocalInt(GetModule(),"OS_KILLTYPHUS",30);
}
