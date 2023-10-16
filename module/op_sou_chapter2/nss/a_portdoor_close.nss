//::///////////////////////////////////////////////
//:: Portable Door (Action - Close)
//:: A_PortDoor_Close.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Close the portable door.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 27, 2003
//:://////////////////////////////////////////////

void main()
{
    DelayCommand(2.0, PlayAnimation(ANIMATION_PLACEABLE_CLOSE));
}
