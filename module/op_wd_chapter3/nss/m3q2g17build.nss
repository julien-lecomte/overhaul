//::///////////////////////////////////////////////
//:: M3Q2G21BUILD.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rebuilds the F19 Golem.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  January 2002
//:://////////////////////////////////////////////
#include "M3PLOTINCLUDE"

void main()
{
    CreateGolem(1, GetLocalInt(GetModule(), "NW_G_M3Q2PLOTGOLEMIMMUNITY1"));

}
