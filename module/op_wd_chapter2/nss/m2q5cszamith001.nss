int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) &&
               GetLocalInt(OBJECT_SELF,"NW_L_WitlessTalk") == 10;
    return iResult;
}
