// Checks to see if guard is guarding door to Estates
// in city of Ghaarak Imperial District
// Should NEVER return TRUE

int StartingConditional()
{
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);

    if (GetSubString(GetTag(oDoor), 0, 8) == "DOOR_010")
        SetLocalInt(OBJECT_SELF, "N_TALK_SWITCH", 1);


    return FALSE;
}
