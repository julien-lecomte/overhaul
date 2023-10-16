//::///////////////////////////////////////////////
//:: Flirt
//:: NW_D2_Flirt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a Chr Normal check and a gender check to
    see if the person is of the opposite sex
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 18, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    int nGender = GetGender(GetPCSpeaker());
    if(CheckCharismaNormal())
    {
        if(nGender == GENDER_MALE)
        {
            if(GetGender(OBJECT_SELF) == GENDER_FEMALE)
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        else if (nGender == GENDER_FEMALE)
        {
            if(GetGender(OBJECT_SELF) == GENDER_MALE)
            {
                return TRUE;
            }
            else
            {
                return FALSE;
            }
        }
        else
        {
            return FALSE;
        }
    }
    return FALSE;
}
