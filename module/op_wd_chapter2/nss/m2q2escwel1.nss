int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LWELCARTALK") == 10;
    return iResult;
}
