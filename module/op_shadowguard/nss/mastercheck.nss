// Starting Conditional script: mastercheck
// Should only be placed in a henchman conversation file.
// This function returns TRUE if the pc speaking is not the henchmanís
// current master.
//
// Written by: Celowin
// Last Updated: 7/25/02
//
int StartingConditional()
{
    int iResult;
    iResult = GetPCSpeaker()!=GetMaster();
    return iResult;
}

