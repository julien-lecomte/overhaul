//::///////////////////////////////////////////////
//:: Wizard Class
//:: TEMPL_WIZ01
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if the PC talking to
    the character is a wizard or sorcerer
    25% chance of going down to next priority
    Check if Docks plot done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: March13,2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if ((GetLocalInt(OBJECT_SELF,"counter")!=3) && (GetLocalInt(OBJECT_SELF,"counter")!=2) && (GetLocalInt(GetModule(),"NW_G_M1Q4MainPlot")==100))
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

