void main()
{
    ActionCastFakeSpellAtObject(SPELL_SUMMON_CREATURE_I, OBJECT_SELF, PROJECTILE_PATH_TYPE_DEFAULT);
    DestroyObject(GetAssociate(ASSOCIATE_TYPE_FAMILIAR), 2.0);
}
