int StartingConditional()
{
  int l_iResult;

  l_iResult = GetPCSpeaker() == OBJECT_INVALID &&
              GetLocalInt(OBJECT_SELF,"L_TALKTIMES")  == 1;
  return l_iResult;
}
