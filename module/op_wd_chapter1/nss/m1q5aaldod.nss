//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "M1_Plot"
void main()
{

    switch(GetUserDefinedEventNumber())
    {
        case 500: FleeArea("WP_M1Q5AldoEscape");
        break;
    }

}

