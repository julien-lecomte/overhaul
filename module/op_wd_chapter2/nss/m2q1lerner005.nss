void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Busy",10);
    ActionMoveAwayFromObject(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC));
    DelayCommand(5.0,DestroyObject(OBJECT_SELF));
}
