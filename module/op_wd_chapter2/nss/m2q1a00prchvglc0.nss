int StartingConditional()
{
    int iResult;

    iResult =
    GetLocalInt(GetModule(), "M2Q1A00TALKEDMUNG") == 10
    &&
    GetLocalInt(GetModule(), "M2Q1A00TALKEDPRICHEV") == 10
    ;
    return iResult;
}
