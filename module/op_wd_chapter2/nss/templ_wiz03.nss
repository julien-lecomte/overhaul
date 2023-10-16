//::///////////////////////////////////////////////
//:: Wizard Class
//:: TEMPL_WIZ03
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is a wizard or sorcerer
    25% chance of going down to next priority
*/
//:://////////////////////////////////////////////
//:: Created By: David Gaider
//:: Created On: November 8, 2001
//:://////////////////////////////////////////////

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=1) && (GetLocalInt(OBJECT_SELF,"counter")!=3))
    {
        int roll=d100();
        if (roll>33)
        {
            int nClass;
            nClass = GetLevelByClass(CLASS_TYPE_WIZARD, GetPCSpeaker());
            nClass += GetLevelByClass(CLASS_TYPE_SORCERER, GetPCSpeaker());
            return nClass;
        }
        return FALSE;
    }
    return FALSE;
}

