int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_PLOTBRAN") != 0;
    return iResult;
}
