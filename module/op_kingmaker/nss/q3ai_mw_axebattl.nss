//::///////////////////////////////////////////////
//:: Sets the weapon type to Battle Axe
//:: q3ai_mw_axebattl
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player picks 'battle axe' as his magic weapon type
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 20, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"Q3AI_WEAPON_TYPE",13);
    //13=Battle Axe
}
