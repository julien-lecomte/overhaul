int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetArea(OBJECT_SELF),"NW_A_Ritual") == 0;
    return iResult;
}
