// Glendir has sworn loyalty

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q3_Everlasting_Loyalty") == 1;
    return iResult;
}
