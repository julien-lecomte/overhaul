// returns true if no player has spoken to Aribeth
// and The ritual has not been performed
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPreRitual") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete") == FALSE;
    return bCondition;
}
