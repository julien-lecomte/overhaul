//::///////////////////////////////////////////////
//:: con_cal_nknwking
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calibast has not told the PC about the corrupt king
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_CAL_KING")!=10;
    return iResult;
}
