//::///////////////////////////////////////////////
//:: Witchwork: Stygia Bone Weaver UserDefined
//:: WW_Stygia_BoneWe.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in a Balor to replace the Bone Weaver.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 13, 2002
//:://////////////////////////////////////////////

void main()
{
    //Process Default User-Defined Events
    int iUDNum = GetUserDefinedEventNumber();
    switch (iUDNum)
    {
        case 1001: //User-Defined Heartbeat Event
        {

        }
        break;

        case 1002: //User-Defined OnPerceive Event
        {

        }
        break;

        case 1003: //User-Defined EndCombatRound Event
        {

        }
        break;

        case 1004: //User-Defined OnDialog Event
        {

        }
        break;

        case 1005: //User-Defined OnAttack Event
        {

        }
        break;

        case 1006: //User-Defined OnDamaged Event
        {

        }
        break;

        case 1007: //User-Defined OnDeath Event
        {
            int iSpawn = Random(4)+1;
            object oSpawn = GetNearestObjectByTag("WP_Stygia_Large", OBJECT_SELF, iSpawn);
            location lSpawn = GetLocation(oSpawn);
            object oCenter = GetNearestObjectByTag("WP_StygiaSpawn");

            //Create a Balor to replace the Bone Weaver
            object oStygian = CreateObject(OBJECT_TYPE_CREATURE, "ww_sty_balor", lSpawn, TRUE);
            AssignCommand(oStygian, ActionMoveToObject(oCenter, FALSE, 10.0));
            AssignCommand(oStygian, ActionRandomWalk());
        }
        break;

        case 1008: //User-Defined OnDisturbed Event
        {

        }
        break;
    }
}
