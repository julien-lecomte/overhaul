#include "nw_i0_plot"

void main()
{
    RewardGP(375,GetPCSpeaker(),FALSE);
    RewardXP("NW_RESC_PLOT",100,GetPCSpeaker(),ALIGNMENT_GOOD);
    SetLocalInt(GetModule(),"NW_Resc_Plot",200);
}
