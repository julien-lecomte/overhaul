#include "NW_I0_Plot"
#include "NW_J_FETCH"
void main()
{
    SetLocalInt(Global(), "NW_J_FETCHPLOT", 99);

    if (PlayerHasFetchItem(GetPCSpeaker()) == TRUE)
    {
        TakeFetchItem(GetPCSpeaker());
    }

    TakeGold(250,GetPCSpeaker());
    RewardXP(GetPlotTag(),100,GetPCSpeaker());


}
