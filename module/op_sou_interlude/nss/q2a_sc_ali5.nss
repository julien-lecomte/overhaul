// Starting conditional for Ali: Katriana has asked the player to bring water.

#include "x1_inc_plot"

int StartingConditional()
{
    return GetPlot("Q2_JOURNAL_WATER") == 1;
}
