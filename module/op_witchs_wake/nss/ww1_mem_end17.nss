//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, End 17
//:: WW1_Mem_End17.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the custom token for the end of the
     memorial.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    string sNormalInt = " I have left to tell the king.";
    string sLowInt = " Me leave to go tell king.";
    string sMessage;
    int bIntelligence = CheckIntelligenceNormal();

    if (bIntelligence == TRUE)
    {
        sMessage = sNormalInt;
    }
    else
    {
        sMessage = sLowInt;
    }

    SetCustomToken(9387, sMessage);
    SetLocalInt(OBJECT_SELF, "iEndComplete", 17);
}
