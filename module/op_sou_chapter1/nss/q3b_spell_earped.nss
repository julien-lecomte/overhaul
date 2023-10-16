//::///////////////////////////////////////////////
//:: Name q3b_spell_earped
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On spell cast at for Earth Pedestal in Wizard's dungeon
    If a spell of greater than level 0 is cast on the that pillar,
    it is destroyed and a message "That power of the spell has destroyed this object".
    If you cast any other cantrip other than 'Electric Jolt', a message
    "That spell does nothing." appears.  If 'Acid Splash' is cast,
    Destroy Pillar with message "That spell was obviously the wrong choice"

    Once one token has been made this way,
    deactivate the rest of the pillars so that if ANY spell
    is cast on them the "That spell does nothing." message appears

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 4/03
//:://////////////////////////////////////////////
int GetIsCantrip(int nSpell);
void main()
{
    object oPC = GetLastSpellCaster();
    int nSpell = GetLastSpell();
    object oArea = GetArea(OBJECT_SELF);
    //if none of the pedestal tokens have been recovered yet

    if (GetLocalInt(oArea, "nGotPedToken") != 1)
    {
        //Ignore grenade like effects..
        if (nSpell < 464 || nSpell > 471)
        {
            //was the spell a cantrip
            if (GetIsCantrip(nSpell) == TRUE)
            {
                //correct choice
                if (nSpell == SPELL_ELECTRIC_JOLT)
                {
                    //You get the token - deactivate the other pedestals
                    SetLocalInt(oArea, "nGotPedToken", 1);
                    effect eVis = EffectVisualEffect(VFX_IMP_BREACH);
                    effect eVis2 = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
                    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oPC));

                    CreateItemOnObject("q3b_token", oPC);

                }
                //wrong choice
                else if (nSpell == SPELL_ACID_SPLASH)
                {
                    //message to PC
                    FloatingTextStrRefOnCreature(40489,oPC);
                    //Destroy earth trigger to kill the vfx
                    object oTrigger = GetObjectByTag("q3b_pedearthtrigger");
                    DestroyObject(oTrigger);
                    //Destroy self with a little vfx.
                    effect eImplode = EffectVisualEffect(VFX_FNF_IMPLOSION);'
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImplode, GetLocation(OBJECT_SELF));
                    object oEarthPed = GetObjectByTag("q3b_ped_earth");
                    DestroyObject(oEarthPed);
                    DestroyObject(OBJECT_SELF,0.4);

                }
                //neutral choice
                else
                {
                    //message to PC
                    FloatingTextStrRefOnCreature(40490,oPC);
                }
            }
            //else spell was too high a level so destroy the pedestal
            else
            {
                //message to PC
                FloatingTextStrRefOnCreature(40491,oPC);
                //Destroy water trigger to kill the vfx
                object oTrigger = GetObjectByTag("q3b_pedearthtrigger");
                DestroyObject(oTrigger);
                //Destroy self with a little vfx.
                effect eImplode = EffectVisualEffect(VFX_FNF_IMPLOSION);'
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImplode, GetLocation(OBJECT_SELF));
                DestroyObject(OBJECT_SELF,0.4);
            }
        }
    }
    //else one of the pedestal tokens has already been recovered.
    else
    {
        //message to PC
        FloatingTextStrRefOnCreature(40490,oPC);
    }
}
int GetIsCantrip(int nSpell)
{
    if (nSpell == SPELL_RESISTANCE || nSpell == SPELL_RAY_OF_FROST || nSpell == SPELL_DAZE || nSpell == SPELL_FLARE || nSpell == SPELL_LIGHT || nSpell == SPELL_ELECTRIC_JOLT || nSpell == SPELL_ACID_SPLASH)
        return TRUE;
    return FALSE;
}
