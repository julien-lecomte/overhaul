//::///////////////////////////////////////////////
//:: Sets the weapon type to sickle
//:: q3ai_mw_exosickl
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'sickle' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",63);
    //63=Sickle
}
