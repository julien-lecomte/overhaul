//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_azer
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have the creature do combat shouts.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 14, 2003
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        if(Random(100) < 35)
        {
            SpeakOneLinerConversation("");
        }
    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}
