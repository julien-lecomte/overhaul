//* Only Terari Free
int StartingConditional()
{
 return GetLocalInt(GetModule(),"M2Q2TerariIsFree") == 1
     && GetLocalInt(GetModule(),"M2Q2OrlaneIsFree") == 0
     && GetLocalInt(GetModule(),"M2Q2BreeIsFree") == 0;
}
