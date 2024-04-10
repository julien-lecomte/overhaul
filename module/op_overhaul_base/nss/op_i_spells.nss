//::///////////////////////////////////////////////
//:: Overhaul Include: Spells
//:: op_i_spells.nss
//:://////////////////////////////////////////////
/*
    Include file for Spells and Spell-like Abilities.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_debug"

// These are the games string refs for immunity feedback.
// Format <CUSTOM0> : Immune to XXXX.
// Using this in case SendFeedbackString() is added to the game.
const int STRREF_IMMUNITY_BLINDNESS             = 62467;  //<CUSTOM0> : Immune to Blindness.
const int STRREF_IMMUNITY_CHARM                 = 62470;  //<CUSTOM0> : Immune to Charm.
const int STRREF_IMMUNITY_CONFUSION             = 62465;  //<CUSTOM0> : Immune to Confusion.
const int STRREF_IMMUNITY_CRITICAL_HITS         = 62454;  //<CUSTOM0> : Immune to Critical Hits.
const int STRREF_IMMUNITY_CURSE                 = 62469;  //<CUSTOM0> : Immune to Curse.
const int STRREF_IMMUNITY_DAZE                  = 62464;  //<CUSTOM0> : Immune to Daze.
const int STRREF_IMMUNITY_DEAFNESS              = 62468;  //<CUSTOM0> : Immune to Deafness.
const int STRREF_IMMUNITY_DEATH_MAGIC           = 62455;  //<CUSTOM0> : Immune to Death Magic.
const int STRREF_IMMUNITY_DISEASE               = 62453;  //<CUSTOM0> : Immune to Disease.
const int STRREF_IMMUNITY_DOMINATE              = 62471;  //<CUSTOM0> : Immune to Dominate.
const int STRREF_IMMUNITY_ENTANGLE              = 62472;  //<CUSTOM0> : Immune to Entangle.
const int STRREF_IMMUNITY_FEAR                  = 62456;  //<CUSTOM0> : Immune to Fear.
const int STRREF_IMMUNITY_KNOCKDOWN             = 62457;  //<CUSTOM0> : Immune to Knockdown.
const int STRREF_IMMUNITY_MIND_AFFECTING_SPELLS = 62460;  //<CUSTOM0> : Immune to Mind Affecting Spells.
const int STRREF_IMMUNITY_NEGATIVE_LEVELS       = 62459;  //<CUSTOM0> : Immune to Negative Levels.
const int STRREF_IMMUNITY_PARALYSIS             = 62458;  //<CUSTOM0> : Immune to Paralysis.
const int STRREF_IMMUNITY_POISON                = 62461;  //<CUSTOM0> : Immune to Poison.
const int STRREF_IMMUNITY_SILENCE               = 62473;  //<CUSTOM0> : Immune to Silence.
const int STRREF_IMMUNITY_SLEEP                 = 62463;  //<CUSTOM0> : Immune to Sleep.
const int STRREF_IMMUNITY_SLOW                  = 62474;  //<CUSTOM0> : Immune to Slow.
const int STRREF_IMMUNITY_SNEAK_ATTACKS         = 62462;  //<CUSTOM0> : Immune to Sneak Attacks.
const int STRREF_IMMUNITY_STUN                  = 62466;  //<CUSTOM0> : Immune to Stun.

const int STRREF_SOMEONE = 8349;  // Someone

const int DURATION_TYPE_ROUNDS = 0;
const int DURATION_TYPE_TURNS  = 1;
const int DURATION_TYPE_HOURS  = 2;

// For GetSpellTargetValid similar to Bioware's
const int SPELL_TARGET_ALLALLIES        = 1;  // Allies only
const int SPELL_TARGET_STANDARDHOSTILE  = 2;  // Standard hostile - IE: Will hit allies in certain PvP
const int SPELL_TARGET_SELECTIVEHOSTILE = 3;  // Selective hostile - IE: Will not hit allies

// Perform a saving throw roll.
// Unlike MySavingThrow this will not "return failure in case of immunity" since, well, they're immune!
// Instead they'll be immune and we'll send appropriate feedback messages.
//   Returns: 0 if the saving throw roll failed
//   Returns: 1 if the saving throw roll succeeded
//   Returns: 2 if the target was immune to the save type specified
// Note: If used within an Area of Effect Object Script (On Enter, OnExit, OnHeartbeat), you MUST pass GetAreaOfEffectCreator() into oSaveVersus!
int DoSavingThrow(int nSavingThrow, object oTarget, int nDC, int nSaveType = SAVING_THROW_TYPE_NONE, object oSaveVersus = OBJECT_SELF, float fDelay = 0.0);

// Used to route the resist magic checks into this function to check for spell countering by SR, Globes or Mantles.
//   Return value if oCaster or oTarget is an invalid object: FALSE
//   Return value if spell cast is not a player spell: - 1
//   Return value if spell resisted: 1
//   Return value if spell resisted via magic immunity: 2
//   Return value if spell resisted via spell absorption: 3
int DoResistSpell(object oCaster, object oTarget, float fDelay = 0.0);

// Applies metamagic to the given dice roll
// eg GetDiceRoll(4, 6, METAMAGIC_EMPOWER) will roll 4d6 and apply Empower to it.
int GetDiceRoll(int nNumberOfDice, int nDiceSize, int nMetaMagic, int nBonus = 0);

// Applies metamagic to the given duration
// * nDurationType - The conversion used, rounds, turns (10 rounds) or hours
float GetDuration(int nDuration, int nDurationType, int nMetaMagic);

// Checks if the given target is valid to be targeted by oSource
int GetSpellTargetValid(object oSource, object oTarget, int nTargetType);

// Converts a SAVING_THROW_TYPE_* to an IMMUNITY_TYPE_* where these are checked for in the saving throw functions
// else it will be IMMUNITY_TYPE_NONE (0)
int GetImmuinityTypeFromSavingThrowType(int nSaveType);

// Check and do immunity for the given immunity type.
// It also provides feedback to the given creatures if valid, and the game usually gives such feedback.
int GetIsImmuneWithFeedback(object oCreature, int nImmunityType, object oVersus = OBJECT_INVALID);

// Provide some feedback formatted to the games method of showing immunity feedback
// This doesn't cover every immunity type, only those the game usually feeds back on.
void SendImmunityFeedback(object oCaster, object oTarget, int nImmunityType);

// Perform a saving throw roll.
// Unlike MySavingThrow this will not "return failure in case of immunity" since, well, they're immune!
// Instead they'll be immune and we'll send appropriate feedback messages.
//   Returns: 0 if the saving throw roll failed
//   Returns: 1 if the saving throw roll succeeded
//   Returns: 2 if the target was immune to the save type specified
// Note: If used within an Area of Effect Object Script (On Enter, OnExit, OnHeartbeat), you MUST pass GetAreaOfEffectCreator() into oSaveVersus!
int DoSavingThrow(int nSavingThrow, object oTarget, int nDC, int nSaveType = SAVING_THROW_TYPE_NONE, object oSaveVersus = OBJECT_SELF, float fDelay = 0.0)
{
    // Sanity check
    if (nDC < 1)
    {
        nDC = 1;
    }
    else if (nDC > 255)
    {
        nDC = 255;
    }

    effect eVis;
    int nResult = 0;
    if (nSavingThrow == SAVING_THROW_FORT)
    {
        nResult = FortitudeSave(oTarget, nDC, nSaveType, oSaveVersus);
        if (nResult == 1)
            eVis = EffectVisualEffect(VFX_IMP_FORTITUDE_SAVING_THROW_USE);
    }
    else if (nSavingThrow == SAVING_THROW_REFLEX)
    {
        nResult = ReflexSave(oTarget, nDC, nSaveType, oSaveVersus);
        if (nResult == 1)
            eVis = EffectVisualEffect(VFX_IMP_REFLEX_SAVE_THROW_USE);
    }
    else if (nSavingThrow == SAVING_THROW_WILL)
    {
        nResult = WillSave(oTarget, nDC, nSaveType, oSaveVersus);
        if (nResult == 1)
            eVis = EffectVisualEffect(VFX_IMP_WILL_SAVING_THROW_USE);
    }
    // Apply VFX
    /*
        return 0 = FAILED SAVE
        return 1 = SAVE SUCCESSFUL
        return 2 = IMMUNE TO WHAT WAS BEING SAVED AGAINST
    */
    if (nResult == 1 || nResult == 2)
    {
        if (nResult == 2)
        {
            eVis = EffectVisualEffect(VFX_IMP_MAGIC_RESISTANCE_USE);
            // Provide some feedback formatted to the games method of showing immunity feedback
            // But we don't just fire the effect off - return 2 still that they're immune.
            int nImmunityType = GetImmuinityTypeFromSavingThrowType(nSaveType);

            if (nImmunityType != IMMUNITY_TYPE_NONE)
            {
                SendImmunityFeedback(oSaveVersus, oTarget, nImmunityType);
            }
        }
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
    }
    return nResult;
}

// Used to route the resist magic checks into this function to check for spell countering by SR, Globes or Mantles.
//   Return value if oCaster or oTarget is an invalid object: FALSE
//   Return value if spell cast is not a player spell: - 1
//   Return value if spell resisted: 1
//   Return value if spell resisted via magic immunity: 2
//   Return value if spell resisted via spell absorption: 3
int DoResistSpell(object oCaster, object oTarget, float fDelay = 0.0)
{
    // Alter the delay so it applies just before any other VFX
    if (fDelay > 0.5)
    {
        fDelay = fDelay - 0.1;
    }
    int nResist = ResistSpell(oCaster, oTarget);
    if (nResist == 1)  // Spell Resistance
    {
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_MAGIC_RESISTANCE_USE), oTarget));
    }
    else if (nResist == 2)  // Globe or Immunity: Spell
    {
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_GLOBE_USE), oTarget));
    }
    else if (nResist == 3)  // Spell Mantle
    {
        if (fDelay > 0.5)
        {
            fDelay = fDelay - 0.1;
        }
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SPELL_MANTLE_USE), oTarget));
    }
    return nResist;
}

// Applies metamagic to the given dice roll
// eg GetDiceRoll(4, 6, METAMAGIC_EMPOWER) will roll 4d6 and apply Empower to it.
int GetDiceRoll(int nNumberOfDice, int nDiceSize, int nMetaMagic, int nBonus = 0)
{
    int i, nDamage = 0;
    for (i = 1; i <= nNumberOfDice; i++)
    {
        nDamage += Random(nDiceSize) + 1;
    }
    // Resolve metamagic
    if (nMetaMagic & METAMAGIC_MAXIMIZE)
    {
        nDamage = nDiceSize * nNumberOfDice;
    }
    else if (nMetaMagic & METAMAGIC_EMPOWER)
    {
        nDamage += nDamage / 2;
    }
    // Add bonus if any
    return nDamage + nBonus;
}

// Applies metamagic to the given duration
// * nDurationType - The conversion used, rounds, turns (10 rounds) or hours
float GetDuration(int nDuration, int nDurationType, int nMetaMagic)
{
    float fDuration = 0.0;
    // Resolve metamagic
    if (nMetaMagic & METAMAGIC_EXTEND)
    {
        nDuration *= 2;
    }
    // Return the right duration
    if (nDurationType == DURATION_TYPE_ROUNDS)
    {
        fDuration = RoundsToSeconds(nDuration);
    }
    else if (nDurationType == DURATION_TYPE_TURNS)
    {
        fDuration = TurnsToSeconds(nDuration);
    }
    else if (nDurationType == DURATION_TYPE_HOURS)
    {
        fDuration = HoursToSeconds(nDuration);
    }
    else
    {
        OP_Debug("[ERROR] Spells GetDuration: Incorrect nDurationType.", LOG_LEVEL_ERROR);
    }
    return fDuration;
}

// Checks if the given target is valid to be targeted by oSource
int GetSpellTargetValid(object oSource, object oTarget, int nTargetType)
{
    // If dead, not a valid target
    if (GetIsDead(oTarget))
    {
        return FALSE;
    }

    int bReturnValue = FALSE;

    switch (nTargetType)
    {
        // This kind of spell will affect all friendlies and anyone in my party/faction, even if we are upset with each other currently.
        case SPELL_TARGET_ALLALLIES:
        {
            if (GetIsReactionTypeFriendly(oTarget, oSource) || GetFactionEqual(oTarget, oSource))
            {
                bReturnValue = TRUE;
            }
        }
        break;
        case SPELL_TARGET_STANDARDHOSTILE:
        {
            // This has been rewritten. We do a simple check for the reaction type now.
            // Previously there was a lot of checks for henchmen, AOEs that PCs cast, etc.
            if (!GetIsReactionTypeFriendly(oTarget, oSource))
            {
                bReturnValue = TRUE;
            }
        }
        break;
        // Only harms enemies, ever, such as Call Lightning
        case SPELL_TARGET_SELECTIVEHOSTILE:
        {
            if (GetIsEnemy(oTarget, oSource))
            {
                bReturnValue = TRUE;
            }
        }
        break;
    }

    return bReturnValue;
}

// Converts a SAVING_THROW_TYPE_* to an IMMUNITY_TYPE_* where these are checked for in the saving throw functions
// else it will be IMMUNITY_TYPE_NONE (0)
int GetImmuinityTypeFromSavingThrowType(int nSaveType)
{
    // Only certain saving throw types check immunities in WillSave, ReflexSave or FortitudeSave
    int nImmunityType = IMMUNITY_TYPE_NONE;
    switch (nSaveType)
    {
        case SAVING_THROW_TYPE_DEATH:
            nImmunityType = IMMUNITY_TYPE_DEATH;
            break;
        case SAVING_THROW_TYPE_DISEASE:
            nImmunityType = IMMUNITY_TYPE_DISEASE;
            break;
        case SAVING_THROW_TYPE_FEAR:
            nImmunityType = IMMUNITY_TYPE_FEAR;
            break;
        case SAVING_THROW_TYPE_MIND_SPELLS:
            nImmunityType = IMMUNITY_TYPE_MIND_SPELLS;
            break;
        case SAVING_THROW_TYPE_POISON:
            nImmunityType = IMMUNITY_TYPE_POISON;
            break;
        case SAVING_THROW_TYPE_TRAP:
            nImmunityType = IMMUNITY_TYPE_TRAP;
            break;
    }
    return nImmunityType;
}

// Check and do immunity for the given immunity type.
// It also provides feedback to the given creatures if valid.
int GetIsImmuneWithFeedback(object oCreature, int nImmunityType, object oVersus = OBJECT_INVALID)
{
    if (GetIsImmune(oCreature, nImmunityType, oVersus))
    {
        // Send some feedback
        SendImmunityFeedback(oVersus, oCreature, nImmunityType);

        return TRUE;
    }
    return FALSE;
}

// Provide some feedback formatted to the games method of showing immunity feedback
void SendImmunityFeedback(object oCaster, object oTarget, int nImmunityType)
{
    // Format:
    // <CUSTOM0> : Immune to Mind Affecting Spells.
    int nStrRef = 0;
    string sMessage;
    // We'll use the string ref if possible, else make our own up.
    switch (nImmunityType)
    {
        case IMMUNITY_TYPE_ABILITY_DECREASE: sMessage = "Ability Decrease"; break;
        case IMMUNITY_TYPE_AC_DECREASE: sMessage = "AC Decrease"; break;
        case IMMUNITY_TYPE_ATTACK_DECREASE: sMessage = "Attack Decrease"; break;
        case IMMUNITY_TYPE_BLINDNESS: nStrRef = STRREF_IMMUNITY_BLINDNESS; break;
        case IMMUNITY_TYPE_CHARM: nStrRef = STRREF_IMMUNITY_CHARM; break;
        case IMMUNITY_TYPE_CONFUSED: nStrRef = STRREF_IMMUNITY_CONFUSION; break;
        case IMMUNITY_TYPE_CRITICAL_HIT: nStrRef = STRREF_IMMUNITY_CRITICAL_HITS; break;
        case IMMUNITY_TYPE_CURSED: nStrRef = STRREF_IMMUNITY_CURSE; break;
        case IMMUNITY_TYPE_DAMAGE_DECREASE: sMessage = "Damage Decrease"; break;
        case IMMUNITY_TYPE_DAMAGE_IMMUNITY_DECREASE: sMessage = "Damage Immunity Decrease"; break;
        case IMMUNITY_TYPE_DAZED: nStrRef = STRREF_IMMUNITY_DAZE; break;
        case IMMUNITY_TYPE_DEAFNESS: nStrRef = STRREF_IMMUNITY_DEAFNESS; break;
        case IMMUNITY_TYPE_DEATH: nStrRef = STRREF_IMMUNITY_DEATH_MAGIC; break;
        case IMMUNITY_TYPE_DISEASE: nStrRef = STRREF_IMMUNITY_DISEASE; break;
        case IMMUNITY_TYPE_DOMINATE: nStrRef = STRREF_IMMUNITY_DOMINATE; break;
        case IMMUNITY_TYPE_ENTANGLE: nStrRef = STRREF_IMMUNITY_ENTANGLE; break;
        case IMMUNITY_TYPE_FEAR: nStrRef = STRREF_IMMUNITY_FEAR; break;
        case IMMUNITY_TYPE_KNOCKDOWN: nStrRef = STRREF_IMMUNITY_KNOCKDOWN; break;
        case IMMUNITY_TYPE_MIND_SPELLS: nStrRef = STRREF_IMMUNITY_MIND_AFFECTING_SPELLS; break;
        case IMMUNITY_TYPE_MOVEMENT_SPEED_DECREASE: sMessage = "Movement Speed Decrease"; break;
        case IMMUNITY_TYPE_NEGATIVE_LEVEL: nStrRef = STRREF_IMMUNITY_NEGATIVE_LEVELS; break;
        case IMMUNITY_TYPE_PARALYSIS: nStrRef = STRREF_IMMUNITY_PARALYSIS; break;
        case IMMUNITY_TYPE_POISON: nStrRef = STRREF_IMMUNITY_POISON; break;
        case IMMUNITY_TYPE_SAVING_THROW_DECREASE: sMessage = "Saving Throw Decrease"; break;
        case IMMUNITY_TYPE_SILENCE: nStrRef = STRREF_IMMUNITY_SILENCE; break;
        case IMMUNITY_TYPE_SKILL_DECREASE: sMessage = "Skill Decrease"; break;
        case IMMUNITY_TYPE_SLEEP: nStrRef = STRREF_IMMUNITY_SLEEP; break;
        case IMMUNITY_TYPE_SLOW: nStrRef = STRREF_IMMUNITY_SLOW; break;
        case IMMUNITY_TYPE_SNEAK_ATTACK: nStrRef = STRREF_IMMUNITY_SNEAK_ATTACKS; break;
        case IMMUNITY_TYPE_SPELL_RESISTANCE_DECREASE: sMessage = "Spell Resistance Decrease"; break;
        case IMMUNITY_TYPE_STUN: nStrRef = STRREF_IMMUNITY_STUN; break;
        case IMMUNITY_TYPE_TRAP: sMessage = "Trap"; break;
        default:
        {
            // EG: IMMUNITY_TYPE_NONE (0) or other values we do no messages. This should not occur though.
            if (DEBUG >= LOG_LEVEL_ERROR) OP_Debug("[ERROR] SendImmunityFeedback: Invalid nImmunityType: " + IntToString(nImmunityType));
            return;
        }
        break;
    }

    // If oTarget is valid and oCaster knows of them use that name, else use "Someone" TLK string
    string sTarget;
    if (GetIsObjectValid(oTarget) && (GetObjectSeen(oCaster, oTarget) || GetObjectHeard(oCaster, oTarget)))
    {
        sTarget = GetName(oTarget);
    }
    else
    {
        sTarget = GetStringByStrRef(STRREF_SOMEONE);
    }

    // No string ref available for immunity feedback we  do our own; Bioware didn't provide feedback on several of them (besides in spell scripts a VFX).
    if (nStrRef == 0)
    {
        sMessage = sTarget + " : " + sMessage + ".";
    }
    else
    {
        // Replace <CUSTOM0> with the given named target
        sMessage = RegExpReplace("<CUSTOM0>", GetStringByStrRef(nStrRef), sTarget, REGEXP_BASIC);
    }

    // Send the feedback
    if (GetIsObjectValid(oCaster)) SendMessageToPC(oCaster, sMessage);
    if (GetIsObjectValid(oTarget)) SendMessageToPC(oCaster, sMessage);
}
