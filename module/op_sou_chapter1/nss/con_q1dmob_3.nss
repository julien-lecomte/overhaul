//check to see if Mara is dead
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "Captive_Cook") == 1  && GetLocalInt(GetPCSpeaker(), "Lodar_Job") > 0)
        return TRUE;
    return FALSE;
}
