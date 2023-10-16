//::///////////////////////////////////////////////
//:: act_mw_restore
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The weapon now does restoration
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "x2_inc_itemprop"

void main()
{
    object oPC = GetFirstPC();
    object oMW = GetItemPossessedBy(oPC,"os_magicweapon");
//    itemproperty iOld =
//        ItemPropertyCastSpell(IP_CONST_CASTSPELL_NEUTRALIZE_POISON_5,
//        IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY);
    IPRemoveMatchingItemProperties(oMW,
        ITEM_PROPERTY_CAST_SPELL,
        DURATION_TYPE_PERMANENT,
        IP_CONST_CASTSPELL_NEUTRALIZE_POISON_5);
    itemproperty iProp =
        ItemPropertyCastSpell(IP_CONST_CASTSPELL_RESTORATION_7,
        IP_CONST_CASTSPELL_NUMUSES_1_USE_PER_DAY);
//    RemoveItemProperty(oMW,iOld);
    IPSafeAddItemProperty
        (oMW,iProp,0.0,X2_IP_ADDPROP_POLICY_IGNORE_EXISTING,TRUE,TRUE);
//    AddItemProperty(DURATION_TYPE_PERMANENT,iProp,oMW);
    SetLocalInt(oPC,"OS_MW_CUREPOISON",2);
}
