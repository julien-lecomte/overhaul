//* PC Enters house
int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(),"M2Q1MissusEisenInit") == 1 &&
                GetLocalInt(GetModule(),"NW_G_URTHCURED") == 0 &&
                GetLocalInt(GetModule(),"NW_G_URTHISDEAD") == 0 &&
                GetLocalInt(GetModule(),"M2Q1MissusEisenDialogue") == 1;
    return l_iResult;
}
