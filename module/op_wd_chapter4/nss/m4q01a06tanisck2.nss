////////Check TalkTimes level

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") ==2;
    return iResult;
}
