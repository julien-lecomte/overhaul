//::///////////////////////////////////////////////
//:: AOE Damage Spells
//:: op_s_damage
//:://////////////////////////////////////////////
/*
    Generally reflex-based damage only spells and spell abilties. But it supports
    basic damage vs. save, etc.

    2da holds the AOE information and we can plumb in the rest in a switch
    statement.

    Fireball
    1d6 points of fire damage per caster level, to a maximum of 10d6.

    Scientilating Sphere
    As Fireball but Electrical damage and save.

    Cone of Cold
    Cone for 1d6 cold damage, max 15d6.

    Mestil's Acid Breath
    Cone for 1d6 acid damage, max 10d6.

    Call Lightning
    All enemies within the area of effect take 1d6 points of electrical
    damage per caster level, to a maximum of 10d6.

    Burning Hands
    1d4 fire damage per level, maximum 5d4.

    Horrid Wilting
    1d8 magic damage/level to max of 25d8. Water elementals get +2 save DC.

    Meteor Swarm
    20d6 fire damage, special AOE not affecting centre point.

    Ice Storm
    No save. All creatures in the area of effect take 3d6 points of bludgeoning
    damage and 2d6 points of cold damage. Ice Storm will do an additional 1d6
    cold damage per additional 3 caster levels to a maximum of 8d6 cold damage
    at level 18.

    ----

    Greater Ruin
    The caster deals 35d6 positive damage to a single target. Fortitude half.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nDiceNum, nDiceSize, nDamageType, nSavingThrow = -1, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nDiceNum2, nDiceSize2, nDamageType2 = 0;
    // Toggles
    int nImpact = VFX_NONE, nVis = VFX_NONE, nBeam = VFX_NONE, bDelayRandom = FALSE, bMustBeLiving = FALSE, bWaterElementalBonusDC = FALSE;
    // Delay variables
    float fDelayOverride = 0.0, fRandomMin = 0.4, fRandomMax = 1.1;
    // Can change to selective hostile
    int nTargetType = SPELL_TARGET_STANDARDHOSTILE;


    switch (nSpellId)
    {
        case SPELL_FIREBALL:
        {
            nDiceNum         = min(10, nCasterLevel);
            nDiceSize        = 6;
            nDamageType      = DAMAGE_TYPE_FIRE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            nImpact          = VFX_FNF_FIREBALL;
            nVis             = VFX_IMP_FLAME_M;
        }
        break;
        case SPELL_SCINTILLATING_SPHERE:
        {
            nDiceNum         = min(10, nCasterLevel);
            nDiceSize        = 6;
            nDamageType      = DAMAGE_TYPE_ELECTRICAL;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
            nImpact          = VFX_FNF_ELECTRIC_EXPLOSION;
            nVis             = VFX_IMP_LIGHTNING_S;
        }
        break;
        case SPELL_CONE_OF_COLD:
        {
            nDiceNum         = min(15, nCasterLevel);
            nDiceSize        = 6;
            nDamageType      = DAMAGE_TYPE_COLD;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_COLD;
            nVis             = VFX_IMP_FROST_L;
        }
        break;
        case SPELL_MESTILS_ACID_BREATH:
        {
            nDiceNum         = min(10, nCasterLevel);
            nDiceSize        = 6;
            nDamageType      = DAMAGE_TYPE_ACID;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ACID;
            nVis             = VFX_IMP_ACID_L;
        }
        break;
        case SPELL_CALL_LIGHTNING:
        {
            nTargetType  = SPELL_TARGET_SELECTIVEHOSTILE;
            bDelayRandom = TRUE;

            nDiceNum         = min(10, nCasterLevel);
            nDiceSize        = 6;
            nDamageType      = DAMAGE_TYPE_ELECTRICAL;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
            nVis             = VFX_IMP_LIGHTNING_M;
        }
        break;
        case SPELL_BURNING_HANDS:
        {
            nDiceNum         = min(5, nCasterLevel);
            nDiceSize        = 4;
            nDamageType      = DAMAGE_TYPE_FIRE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            nVis             = VFX_IMP_FLAME_S;
        }
        break;
        case SPELL_HORRID_WILTING:
        {
            nDiceNum         = min(25, nCasterLevel);
            nDiceSize        = 8;
            nDamageType      = DAMAGE_TYPE_MAGICAL;
            nSavingThrow     = SAVING_THROW_FORT;
            nImpact          = VFX_FNF_HORRID_WILTING;
            nVis             = VFX_IMP_NEGATIVE_ENERGY;
            bDelayRandom     = TRUE;
            fRandomMin       = 1.5;
            fRandomMax       = 2.5;
            bMustBeLiving    = TRUE;
            bWaterElementalBonusDC = TRUE;
        }
        break;
        case SPELL_EPIC_RUIN:
        {
            nDiceNum         = 35;
            nDiceSize        = 6;
            nDamageType      = DAMAGE_TYPE_DIVINE;
            nSavingThrow     = SAVING_THROW_FORT;
            nImpact          = VFX_FNF_SCREEN_SHAKE;
            nVis             = VFX_COM_BLOOD_CRT_RED;
            fDelayOverride   = 1.3;
                // This was used in the original Bioware script, not sure why, is a static delay for the VFX now (taken from vim_ruin.mdl)
                // GetDistanceBetween(oTarget, oCaster)/(3.0 * log(GetDistanceBetween(oTarget, oCaster)) + 2.0);

            // Special visuals
            ApplyVisualEffectToObject(VFX_FNF_GREATER_RUIN, oTarget);
            DelayCommand(fDelayOverride, ApplyVisualEffectToObject(VFX_COM_CHUNK_BONE_MEDIUM, oTarget));
        }
        break;
        case SPELL_FLAME_LASH:
        {
            nDiceNum         = max(2, 1 + (nCasterLevel/3));
            nDiceSize        = 6;
            nDamageType      = DAMAGE_TYPE_FIRE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            nVis             = VFX_IMP_FLAME_S;
            nBeam            = VFX_BEAM_FIRE_LASH;
            fDelayOverride   = 1.0;
        }
        break;
        case SPELL_METEOR_SWARM:
        {
            nDiceNum         = 20;
            nDiceSize        = 6;
            nDamageType      = DAMAGE_TYPE_FIRE;
            nSavingThrow     = SAVING_THROW_REFLEX;
            nSavingThrowType = SAVING_THROW_TYPE_FIRE;
            nImpact          = VFX_FNF_METEOR_SWARM;
            nVis             = VFX_IMP_FLAME_M;
            bDelayRandom     = TRUE;
        }
        break;
        case SPELL_ICE_STORM:
        {
            nDiceNum         = 3;
            nDiceSize        = 6;
            nDamageType      = DAMAGE_TYPE_BLUDGEONING;
            nDiceNum2        = 2 + (min(20, nCasterLevel) / 3);
            nDiceSize2       = 6;
            nDamageType2     = DAMAGE_TYPE_COLD;
            nImpact          = VFX_FNF_ICESTORM;
            nVis             = VFX_IMP_FROST_S;
            bDelayRandom     = TRUE;
        }
        break;
        default:
            Debug("[op_s_damage] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = 0.0;
        if (fDelayOverride != 0.0)
        {
            fDelay = fDelayOverride;
        }
        else if (GetSpellIsAreaOfEffect(nSpellId))
        {
            fDelay = bDelayRandom ? GetRandomDelay(fRandomMin, fRandomMax) : GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;
        }

        // Beam gets applied regardless
        ApplyBeamToObject(nBeam, oTarget);

        // Immunity checks
        if (!bMustBeLiving || GetIsLiving(oTarget))
        {
            if (!DoResistSpell(oTarget, oCaster, fDelay))
            {
                // Roll damage
                int nDamage = GetDiceRoll(nDiceNum, nDiceSize);
                int nDamage2 = 0;
                if (nDamageType2 > 0)
                {
                    nDamage2 = GetDiceRoll(nDiceNum2, nDiceSize2);
                }

                // Damage modification based on save (half, with Reflex allowing feats to reduce further)
                if (nSavingThrow != -1)
                {
                    int nSaveDC = nSpellSaveDC;

                    if (bWaterElementalBonusDC && GetIsWaterElemental(oTarget)) nSaveDC += 2;

                    int bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSaveDC, nSavingThrowType, fDelay);

                    nDamage = GetDamageBasedOnFeats(nDamage, oTarget, nSavingThrow, bSaved);

                    if (nDamage2 > 0)
                    {
                        nDamage2 = GetDamageBasedOnFeats(nDamage2, oTarget, nSavingThrow, bSaved);
                    }
                }

                if (nDamage > 0)
                {
                    effect eDamage = EffectDamage(nDamage, nDamageType);

                    if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                }
                if (nDamage2 > 0)
                {
                    effect eDamage = EffectDamage(nDamage2, nDamageType2);
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                }
            }
        }
    }
}

