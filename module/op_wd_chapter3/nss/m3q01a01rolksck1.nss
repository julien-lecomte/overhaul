//////Check if PC has told Rolkid their name

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"RolkidName") ==2;
    return iResult;
}

