int StartingConditional()
{
    int  bCondition = GetTag(OBJECT_SELF) == "M1Q6A01Aribeth" &&
                      GetLocalInt(OBJECT_SELF,"NW_L_Scene") == 0;
    if(bCondition)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Scene",GetLocalInt(OBJECT_SELF,"NW_L_Scene") + 1);
        ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3);
    }
    return bCondition;
}
