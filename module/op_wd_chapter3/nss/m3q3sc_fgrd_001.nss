int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"M3Q3GuardianCountdown") == 30;
    if(iResult == TRUE)
        {
        DelayCommand(5.0,SignalEvent(OBJECT_SELF,EventUserDefined(300)));
        }
    return iResult;
}
