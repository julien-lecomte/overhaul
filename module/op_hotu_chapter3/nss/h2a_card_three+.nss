//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Is Card Greater Than Three? (Action Script)
//:: H2a_Card_Three+.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Determines whether or not the card is greater
     than a Three and whether or not the NPC is
     going to tell the truth. The resulting answer
     is saved out on the NPC for future reference.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

void main()
{
    int iCardDrawn = GetLocalInt(OBJECT_SELF, "iCardDrawn");
    int bThree = FALSE;

    //The last two digits determine if it's greater than a Three
    string sCardDrawn = IntToString(iCardDrawn);
    string sValueDrawn = GetStringRight(sCardDrawn, 2);
    int iValueDrawn = StringToInt(sValueDrawn);
    if (iValueDrawn > 3)
    {
        bThree = TRUE;
    }

    //Decide if he's telling the truth and save it out for future reference.
    int bTruth = Random(2);
    SetLocalInt(OBJECT_SELF, "bTellingTruth", bTruth);

    //Determine the answer he's going to give, based on the above results, and
    //save it out for future reference.
    int bAnswer;
    if (bThree == bTruth)
    {
        bAnswer = TRUE;
    }
    if (bThree != bTruth)
    {
        bAnswer = FALSE;
    }
    SetLocalInt(OBJECT_SELF, "bAnswer", bAnswer);
}
