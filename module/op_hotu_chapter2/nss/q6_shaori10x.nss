//::///////////////////////////////////////////////
//:: q6_Shaori10x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Set Shaori talk variable to 20 (mirror mentioned)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 3, 2003
//:://////////////////////////////////////////////


void main()
{
 AddJournalQuestEntry("q6_shaori",10,GetPCSpeaker());
 if (GetLocalInt(OBJECT_SELF,"Shaori")<=10)
    {
    SetLocalInt(OBJECT_SELF,"Shaori",10);
    }
}
