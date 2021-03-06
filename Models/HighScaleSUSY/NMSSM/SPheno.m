MINPAR={{ 1, m0},
        { 2, m12},
        { 3, TanBeta},
        { 5, Azero},
        {61, LambdaInput},
        {62, KappaInput},
        {63, ALambdaInput},
        {64, AKappaInput},        
        {65, MuEffInput}
        };

RenormalizationScaleFirstGuess = 173^2;
RenormalizationScale =  MFu2[3];


UseParameterAsGUTscale = {m0};

BoundaryHighScale={
 {T[Ye], Azero*Ye},
 {T[Yd], Azero*Yd},
 {T[Yu], Azero*Yu},
 {mq2, DIAGONAL m0^2},
 {ml2, DIAGONAL m0^2},
 {md2, DIAGONAL m0^2},
 {mu2, DIAGONAL m0^2},
 {me2, DIAGONAL m0^2},
 {MassB, m12},
 {MassWB,m12},
 {MassG,m12}
};


ParametersToSolveTadpoles = {m2};

DEFINITION[MatchingConditions]=Default[OHDM];

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues ={m0 -> 10^5, m12 -> 10^5, Azero -> 0, LambdaInput->0.4, KappaInput->0.2, ALambdaInput->0,  Muinput->10^5,  AKappaInput->-2/3 10^5, MuEffInput->10^6, TanBeta->1};


(*---------------------------------------------------*)
(* information for matching to MSSM *)
(*---------------------------------------------------*)

MatchingToModel= {"NMSSM"};
MatchingScale = {m0};

IncludeParticlesInThresholds={
 {hh,Ah,Hpm,Su,Sd,Se,Sv,Chi,Cha}
};

AssumptionsMatchingScale={
 {
  {vd,epsUV*Cos[ArcTan[TanBeta]]}, 
  {vu,epsUV*Sin[ArcTan[TanBeta]]}
 }
};

BoundaryMatchingScaleUp={
{
  {\[Lambda],LambdaInput},
  {\[Kappa],KappaInput}, 
  {T[\[Lambda]],ALambdaInput*LambdaInput},
  {T[\[Kappa]],AKappaInput*KappaInput},
  {Yu, Sqrt[1+TanBeta^2]/TanBeta*Yu},
  {Yd, Sqrt[1+TanBeta^2]*Yd},
  {Ye, Sqrt[1+TanBeta^2]*Ye},
  {vS, Sqrt[2] MuEffinput/LambdaInput}
 }
};

BoundaryMatchingScaleDown={
{
  {lamSM, -1/3 EFTcoupNLO[hh[1].hh[1].hh[1].hh[1]]}
 }
};



ParametersToSolveTadpoleMatchingScale={
 {mHd2,mHu2,ms2}
};
 


