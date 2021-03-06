MINPAR={{ 1, m0},
        { 2, mGauginos},
        { 3, TanBeta},                
        { 4, Muinput},        
        { 5, Azero},
        { 6, MAinput}     
        };

RealParameters = {TanBeta};

UseParameterAsGUTscale = {m0};

ParametersToSolveTadpoles = {M112,M222};

RenormalizationScaleFirstGuess = 175.^2;
RenormalizationScale = 175.^2;

BoundaryHighScale={
 {T[Ye], Azero*Ye},
 {T[Yd], Azero*Yd},
 {T[Yu], Azero*Yu},
 {mq2, DIAGONAL m0^2},
 {ml2, DIAGONAL m0^2},
 {md2, DIAGONAL m0^2},
 {mu2, DIAGONAL m0^2},
 {me2, DIAGONAL m0^2}
};

BoundaryRenScale={
 {M12, -MAinput^2 TanBeta/(1+TanBeta^2)}
};


AddTreeLevelUnitarityLimits=True;

DEFINITION[MatchingConditions]={ 
 {vd,vSM*Cos[ArcTan[TanBeta]]},
 {vu,vSM*Sin[ArcTan[TanBeta]]},
 {Ye, YeSM*vSM/vd},
 {Yd, YdSM*vSM/vd},
 {Yu, YuSM*vSM/vu},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


DefaultInputValues ={m0 -> 10^6, mGauginos -> 10^3,Azero -> 0, Muinput->10^3, MAinput->500, TanBeta->2.};

(* ------------------------------------ *)
(* Matching to the MSSM                 *)
(* ------------------------------------ *)


MatchingToModel={"MSSM"};
MatchingScale = {m0};


IncludeParticlesInThresholds={
 {Su,Sd,Se,Sv}
};

BoundaryMatchingScaleUp={
 {
  {Yu, (Yu + Sqrt[2]*ShiftCoupNLO[bar[Fu].Fu.hh[2]][PL])},
  {Yd, (Yd + Sqrt[2]*ShiftCoupNLO[bar[Fd].Fd.hh[1]][PL])},
  {Ye, (Ye + Sqrt[2]*ShiftCoupNLO[bar[Fe].Fe.hh[1]][PL])},
  {MassB, mGauginos},
  {MassWB,mGauginos},
  {MassG, mGauginos},
  {\[Mu], Muinput},
  {B[\[Mu]], -M12}
 }
};
 
BoundaryMatchingScaleDown={
{
 {MG, mGauginos},
 {MW, mGauginos},
 {MB, mGauginos},
 {MuSplit,\[Mu]},
 {g1u,-2*(EFTcoupNLO[Chi[fB].Chi[FHu0].hh[2]][PL])},
 {g2u, 2*(EFTcoupNLO[Chi[fW0].Chi[FHu0].hh[2]][PL])}, 
 {g1d, 2*(EFTcoupNLO[Chi[fB].Chi[FHd0].hh[1]][PL])},
 {g2d,-2*(EFTcoupNLO[Chi[fW0].Chi[FHd0].hh[1]][PL])},
 {Lambda1, -1/6 EFTcoupNLO[hh[1].hh[1].hh[1].hh[1]]},
 {Lambda2, -1/6 EFTcoupNLO[hh[2].hh[2].hh[2].hh[2]]},
 {Lambda3, -EFTcoupNLO[hh[1].hh[1].Hpm[2].conj[Hpm[2]]]},
 {Lambda4,  EFTcoupNLO[hh[1].hh[2].Hpm[2].conj[Hpm[1]]] + I*EFTcoupNLO[hh[1].Ah[2].Hpm[1].conj[Hpm[2]]]},
 {Lambda5,  EFTcoupNLO[hh[1].hh[2].Hpm[2].conj[Hpm[1]]] - I*EFTcoupNLO[hh[1].Ah[2].Hpm[1].conj[Hpm[2]]]},
 {Lambda6, -EFTcoupNLO[hh[1].hh[2].Hpm[1].conj[Hpm[1]]]},
 {Lambda7, -EFTcoupNLO[hh[1].hh[2].Hpm[2].conj[Hpm[2]]]}
 }
};

AssumptionsMatchingScale={
{
 {vd, epsUV},
 {vu, epsUV},
 {B[\[Mu]],epsUV^2},
 {\[Mu],epsUV},
 {MassB, epsUV},
 {MassWB, epsUV}
 }
};

ParametersToSolveTadpoleMatchingScale={
 {mHd2,mHu2}
};
 
