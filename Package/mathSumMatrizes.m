(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ::Input::Initialization:: *)
(* ---------------------------------- *)
(* Sum Properties *)
(* ---------------------------------- *)




(* ::Input::Initialization:: *)
sum[a_,b_,0]:=0;
sum[a_Integer,b_,c_]:=1 /; (a >= b && a <= c );
sum[a_Integer,b_,c_]:=0 /; (a < b );
sum[a_Integer,b_,c_]:=0/; (a > c );
sum[a_,b_,c_,d_] :=sum[a,1,c-b+1,d /. a -> a+b-1] /; (b != 1)
sum[a_,b_,b_]:=Delta[a,b];
sum[a_,1,ende_,sum[b_,1,ende_,fak1_]fak2_]:=sum[a,1,ende, fak2* (fak1 /. b ->a)] /;(( FreeQ[fak1,Delta[a,b]]==False) || ( FreeQ[fak1, Delta[b,a]]==False));
sum[a_,b_Integer,c_Integer]:=0 /;  (b>c)
sum[a_,b_,c_,d_]:=Block[{}, Return[d /. a-> b];]/;(b==c);
sum[a_,b_,c_,d_]:=(1+c-b)*d /; FreeQ[d,a];
sum[a_,b_,c_,d_ Delta[a_,n_Integer]]:=If[n>c|| n < b,0,d /. a->n]; (* CHECK *)
sum[ind_,1,b_,Delta[x_,ind_]]:=ThetaStep[x,b]; (* CHECK *)



(* Color algebra  *)

sum[a_,1,3,sum[b_,1,3,Lam[_,b_,a_] sum[c_,1,3,Lam[_,a_,c_] Lam[_,c_,b_]]]]:=0;
sum[a_,1,3,sum[b_,1,3,Lam[_,a_,b_] sum[c_,1,3,Lam[_,b_,c_] Lam[_,c_,a_]]]]:=0;

sum[a_,1,3,sum[b_,1,3,Lam[c_,a_,b_] Lam[d_,b_,a_]]]:=Delta[c,d]*2;
sum[j3_,1,3,sum[j2_,1,3,Lam[act3_,j2_,j3_] sum[j1_,1,8,Lam[j1_,ct1_,ct2_] Lam[j1_,j3_,j2_]]]]:= sum[j1,1,8,Lam[j1,ct1,ct2] Delta[j1,act3]*2];
sum[j3_,1,3,sum[j2_,1,3,Lam[act3_,j3_,j2_] sum[j1_,1,8,Lam[j1_,ct1_,ct2_] Lam[j1_,j2_,j3_]]]]:= sum[j1,1,8,Lam[j1,ct1,ct2] Delta[j1,act3]*2];

sum[j6_,1,3,sum[j5_,1,3,Lam[act1_,j5_,j6_] sum[j4_,1,3,sum[j3_,1,3,Lam[A1__] sum[j2_,1,3,Lam[A2__] sum[j1_,1,8,Lam[j1_,a_,b_] Lam[j1_,j6_,j5_]]]]]]]:=
sum[j4,1,3,sum[j3,1,3,Lam[A1] sum[j2,1,3,Lam[A2] sum[j1,1,8,Lam[j1,a,b]2 Delta[j1,act1]]]]];
sum[j6_,1,3,sum[j5_,1,3,Lam[act1_,j6_,j5_] sum[j4_,1,3,sum[j3_,1,3,Lam[A1__] sum[j2_,1,3,Lam[A2__] sum[j1_,1,8,Lam[j1_,a_,b_] Lam[j1_,j5_,j6_]]]]]]]:=
sum[j4,1,3,sum[j3,1,3,Lam[A1] sum[j2,1,3,Lam[A2] sum[j1,1,8,Lam[j1,a,b]2 Delta[j1,act1]]]]];

sum[a_,1,3,sum[b_,1,3,Lam[x1_,a_,b_] sum[c_,1,3, Lam[x2_,b_,c_] Lam[x3_,c_,a_]]]]:=  I  4 fSU3[x1,x2,x3] +sum[a,1,3,sum[b,1,3,Lam[x1,a,b] sum[c,1,3, Lam[x3,b,c] Lam[x2,c,a]]]]/; (OrderedQ[{x2,x3}]==False);
sum[a_,1,3,sum[b_,1,3,Lam[x1_,b_,a_] sum[c_,1,3, Lam[x2_,c_,b_] Lam[x3_,a_,b_]]]]:=  I 4 fSU3[x1,x2,x3] +sum[a,1,3,sum[b,1,3,Lam[x1,b,a] sum[c,1,3, Lam[x3,c,b] Lam[x2,a,c]]]] /;OrderedQ[{x2,x3}]==False;
sum[j4_,1,3,sum[j3_,1,3,Lam[act1_,j3_,j4_] sum[j2_,1,3, Lam[act2_,j4_,j2_] Lam[act3_,j2_,j3_]]]]:=  I 4 fSU3[act1,act2,act3] +sum[j4,1,3,sum[j3,1,3,Lam[act1,j3,j4] sum[j2,1,3, Lam[act3,j4,j2] Lam[act2,j2,j3]]]] /;OrderedQ[{act2,act3}]==False;


ThetaStep[act1,8]=1;
ThetaStep[act2,8]=1;
ThetaStep[act3,8]=1;
ThetaStep[act4,8]=1;

sum[a_,1,b_,c__]:=sum[a,1,b,(c /. ThetaStep[a,b]->1)] /; (FreeQ[c,ThetaStep[a,b]]==False)

LorentzProduct[a_,1]:=a;
LorentzProduct[1,a_]:=a;
LorentzProduct[a_,LorentzProduct[b_,c_]]:=LorentzProduct[a,b,c];

Unprotect[Plus];
sum[b_,1,g_,conj[M1_[x_,b_+c_]] M2_[y_,b_+c_]] + sum[a_,1,c_,conj[M1_[x_,a_]] M2_[y_,a_]]:= sum[a,1,c+g,conj[M1[x,a]] M2[y,a]];
Protect[Plus];

sum[a_,b_,c_,0]:=0;

sum[a_,b_,c_,d_ e_]:=d sum[a,b,c,e] /; (FreeQ[d,a]  && FreeQ[d,StillCalcSum])

sum[a_,b_,c_, conj[M_[a_,x_]] M_[a_,y_]+conj[M_[a_+c_,x_]] M_[a_+c_,y_]]:=sum[a,b,2*c,conj[M[a,x]] M[a,y]];
sum[a_,b_,c_, conj[M_[a_,x_]] M_[a_,y_]]:=Delta[x,y] /; getDim[M]==c && b==1;
sum[a_,b_,c_, conj[M_[x_,a_]] M_[y_,a_]]:=Delta[x,y] /; getDim[M]==c && b==1;
UseCheckMatrixProduct=True;

Delta[a_List,b_]:=Delta[a[[1]],b];

sum[a_,b_,c_,d_]:=Block[{res,j},
deltas=Cases[d,x:(Delta[a,y_]),10];
res=d*ThetaStep[a,c];
For[j=1,j<=Length[deltas],
If[deltas[[j,2]]===a,
res =res /. deltas[[j,2]]->deltas[[j,1]];,
res =res /. deltas[[j,1]]->deltas[[j,2]];
];
j++;];
Return[res];
] /; (FreeQ[d,Delta[a,_]]==False && FreeQ[d,StillCalcSum]==True);

ThetaStep[a_Integer,b_Integer]:=If[a<=b,Return[1];,Return[0];];

getDimParameters[x_]:=Block[{pos},
If[Head[x]===Adj ||  Head[x]===T || Head[x]===conj || Head[x]===Conj,
pos=Position[parameters,x[[1]]];,
pos=Position[parameters,x]
];
If[pos=!={},
Return[Extract[parameters,pos[[1,1]]][[3]]];,
Return[{0}];
];
];




(* ::Input::Initialization:: *)
(*------------------------------------- *)
(* Group Factors *)
(*------------------------------------- *)


(* ::Input::Initialization:: *)
(*------- SU2 ---------*)

Sigma={{{0,1},{1,0}},{{0,-I},{I,0}},{{1,0},{0,-1}}};

Sig[a_Integer,b_Integer,c_Integer]:=Sigma[[a,b,c]];

(*
conj[Sig[a_,2,1]]:=Sig[a,1,2];
conj[Sig[a_,1,2]]:=Sig[a,2,1];
conj[Sig[a_,b_,b_]]:=Sig[a,b,b];
*)
conj[Sig[a_,b_,c_]]:=Sig[a,c,b]; 
SigmaProd[gen4_Integer,gen3_Integer][a_Integer,b_Integer] := Sig[gen4,a,b]*Sig[gen3,a,b]; 


(*--------SU3----------*)

(* Gell-Mann matrices *)
Lambda={{{0,1,0},{1,0,0},{0,0,0}},{{0,-I,0},{I,0,0},{0,0,0}},{{1,0,0},{0,-1,0},{0,0,0}},{{0,0,1},{0,0,0},{1,0,0}},{{0,0,-I},{0,0,0},{I,0,0}},{{0,0,0},{0,0,1},{0,1,0}},{{0,0,0},{0,0,-I},{0,I,0}},1/Sqrt[3] {{1,0,0},{0,1,0},{0,0,-2}}};

(* Represenation matrices of Susyno *)
Lambda={{{0,1,0},{1,0,0},{0,0,0}},{{0,0,0},{0,0,1},{0,1,0}},{{0,0,I},{0,0,0},{-I,0,0}},{{0,-I,0},{I,0,0},{0,0,0}},{{0,0,0},{0,0,-I},{0,I,0}},{{0,0,-1},{0,0,0},{-1,0,0}},{{2/Sqrt[3],0,0},{0,-(1/Sqrt[3]),0},{0,0,-(1/Sqrt[3])}},{{0,0,0},{0,1,0},{0,0,-1}}};

Lam[a_Integer,b_Integer,c_Integer] :=Lambda[[a,b,c]];
LamPS[a_Integer,b_Integer,c_Integer] :=LambdaPS[[a,b,c]]/2;

SetAttributes[LambdaProd,Orderless];
SetAttributes[SigmaProd,Orderless];

conj[Lam[a_,ct2,ct1]]:=Lam[a,ct1,ct2];
conj[Lam[a_,ct3,ct1]]:=Lam[a,ct1,ct3];
conj[Lam[a_,ct3,ct2]]:=Lam[a,ct2,ct3];

(* conj[Lam][a___]:=conj[Lam[a]]; *)

GeneratorMatrices[SU[4]]=LambdaPS;
GeneratorMatrices[SU[3]]=Lambda;
GeneratorMatrices[SU[2]]=Sigma;

conj[Lam[a_,b_,c_]]:=Lam[a,c,b];
conj[fSU3[a__]]:=fSU3[a];
conj[fSU2[a__]]:=fSU2[a];

fSU4[a_Integer,b_Integer,c_Integer]:=fPS[[a,b,c]];
fSU3[a_Integer,b_Integer,c_Integer]:=Levi[[a,b,c]];
fSU2[a_Integer,b_Integer,c_Integer]:=Signature[{a,b,c}];
fSU2[a_,b_,b_]:=0;
fSU2[a_,a_,b_]:=0;
fSU2[a_,b_,a_]:=0;
sum[a_,1,3,d_]:=Sum[d,{a,1,3}] /; (FreeQ[d,fSU2[a,x_,y_]]==False);


(* ::Input::Initialization:: *)
(*---------------------------------*)
(* Matrices *)
(*---------------------------------*)

E2={{1,0},{0,1}};
E6=IdentityMatrix[6];
E3=IdentityMatrix[3];

eps2={{0,1},{-1,0}};

epsTensor[a___,b_,c_,d___]:=-epsTensor[a,c,b,d] /; OrderedQ[{b,c}]==False
epsTensor[a__Integer]:=1 /; OrderedQ[{a}] && Intersection[{a}]==={a};
epsTensor[a__]:=0 /; Intersection[{a}]=!={a};


(* ::Input::Initialization:: *)
CalcDelta[expr_]:=Block[{i,j},
If[Head[expr]==List,erg=List@@expr;erg=CalcDelta/@erg;Return[List@@erg];];
If[Head[expr]==Plus, erg=List@@expr;erg=CalcDelta/@erg;Return[Plus@@erg];];
expand=Expand[expr]//. (Delta[a_Integer,b_] sum[b_,1,c_Integer]/;a>c):>0;
If[Head[expand]==Plus,
erg=List@@expand;
erg=CalcDelta/@erg;
Return[Plus@@erg];
];

If[FreeQ[expr,Delta]==False,
(* expand=expand//.Delta[a_,b_] Delta[c_,b_] sum[b_,__]\[Rule]Delta[a,c]; *)
expand=expand//.(Delta[a_,b_] Delta[c_,b_] sum[b_,__]/; FreeQ[expand/. Delta[a,b] Delta[c,b] sum[b,__]->Delta[a,c],b])->Delta[a,c]; 
deltas=Cases[Cases[expand,x:(Delta[a_,b_]),3],x_?IntF];
 If[Length[deltas]>0,
expand =expand /. Flatten[Table[{deltas[[j,2]]->deltas[[j,1]]},{j,1,Length[deltas]}]];
]; 
];

 If[FreeQ[expr,Delta]==False,
deltas=Cases[expand,x:(Delta[a_,b_]),3];
 For[i=1,i<=Length[deltas],
If[FreeQ[expand,sum[deltas[[i,1]],aaa_,bbb_]]==False,
expand =expand /. {deltas[[i,1]]->deltas[[i,2]]};
 ];
i++;];
]; 

If[UseCheckMatrixProduct==True,
Return[CheckMatrixProduct[expand]];,
Return[expand];
];

];

DeltaIntQ[x_]:=If[Head[x]===Delta,If[IntegerQ[x[[1]]],Return[True];,Return[False]];,Return[False]];
IntF[x_]:=IntegerQ[x[[1]]];



CheckMatrixProduct[term_]:=Block[{i,expand,op1,op2,summe, iterator},
expand=term;
op1={};op2={};summe={};iterator={};
If[FreeQ[expand,sum[b_,1,d_]*A_[x_,b_] conj[B_[z_,b_]]]==True,
Return[term];,

needed=term;
While[FreeQ[needed,sum[b_,1,d_]*A_[x_,b_] conj[B_[z_,b_]]]==False,
needed=needed /. {sum[b_,1,d_]*A_[x_,b_] conj[B_[z_,b_]] -> Op1[A]*Op2[B]*Fin[d]*Iter[b]};

op1= Join[op1,{Cases[needed,Op1[_]][[1,1]]}];
op2= Join[op2,{Cases[needed,Op2[_]][[1,1]]}];
summe=Join[summe,{Cases[needed,Fin[_]][[1,1]]}];
iterator=Join[iterator,{Cases[needed,Iter[_]][[1,1]]}];

needed = needed /. {Op1[_]->1,Op2[_]->1,Fin[_]->1,Iter[_]->1};
];

For[i=1,i<=Length[op1],
prod=Cases[ListMatrixProdukt,{op1[[i]],op2[[i]],_,_}];
If[prod=!={},
If[prod[[1,3]]==summe[[i]],
If[Head[prod[[1,4]]]===conj,
expand=expand /. op1[[i]][x_,b_] conj[op2[[i]][z_,b_]] -> prod[[1,4]][x,z]/. sum[iterator[[i]],1,_] ->1;,
expand=expand /. op1[[i]][x_,b_] conj[op2[[i]][z_,b_]] -> prod[[1,4]][z,x]/. sum[iterator[[i]],1,_] ->1;
];
];
];
i++;];
Return[expand];];
]; 

CheckMatrixProduct[x_Plus]=CheckMatrixProduct/@x;

CheckMatrixProduct2[x_]:=Block[{temp,res,i},
temp=x;
While[FreeQ[temp,sum[a_,b_,c_,d_]]==False,
temp = temp /. sum[a_,b_,c_,d_]->d  sum[a,b,c];
];
temp=Expand[temp]  //. {j1->ix001,j2->ix002,j3->ix003,j4->ix004,j5->ix005,j6->ix006,j7->ix007,j8->ix008,j9->ix009,j10->ix0010,j11->ix0011};
res=0;
If[Head[temp]===Plus,
For[i=1,i<=Length[temp],
res+= CheckMatrixProduct[temp[[i]]];
i++;];,
res= CheckMatrixProduct[temp];
];
res=makeSumAll[res];
Return[res];
];

CheckMatrixProduct2[x_List]:=CheckMatrixProduct2 /@x;


getDescription[x_]:=Block[{pos},
pos=Position[Transpose[ParameterDefinitions][[1]],x];
If[pos==={},
Return[ToString[x]];,
If[FreeQ[Extract[ParameterDefinitions,pos[[1,1]]][[2]],Description],
Return[ToString[Extract[ParameterDefinitions,pos[[1,1]]][[1]]]];,
Return[(Description /. Extract[ParameterDefinitions,pos[[1,1]]][[2]])];
];
];
];

MassMatrix[y_]:=ShowMassMatrix[y,True];
MassMatrixUnexpanded[y_]:=ShowMassMatrix[y,False];

ShowMassMatrix[y_,Full_]:=Block[{pos,field,i,states},
If[FreeQ[diracFermions[ALL],y]==False,
field =  (y /. diracSub[ALL])[[1]];,
field = y;
];

If[getType[field,False,ALL]=!=V,
For[i=1,i<=Length[NameOfStates],
If[Head[MixES[NameOfStates[[i]]]]===List,
If[FreeQ[MixedNames[NameOfStates[[i]]],field]==False,
pos = Position[MixedNames[NameOfStates[[i]]],field];
states = NameOfStates[[i]];
];
];
i++;];



If[Head[pos]===List,
If[Full==True,
Return[MassMatricesFull[states][[pos[[1,1]]]]];,
Return[MassMatrices[states][[pos[[1,1]]]]];
];,
Print["Mass matrix for ",y," does not exist!"];
];,
For[i=1,i<=Length[NameOfStates],
If[FreeQ[DEFINITION[NameOfStates[[i]]][GaugeSector],field]==False,
pos = Position[DEFINITION[NameOfStates[[i]]][GaugeSector],field];
states = NameOfStates[[i]];
];
i++;];
If[Head[pos]===List,
Return[MassMatricesGauge[states][[pos[[1,1]]]]];
];
];
];

getMixingMatrixHead[part_]:=Block[{},
If[Head[part]===conj,
Return[conj[getMixingMatrix[part]]];,
Return[getMixingMatrix[part]];
];
];

getMixingMatrix[part_]:=Block[{i,j,x,res=NoMatrix,pos},
x=RE[part];
If[Head[x /. diracSub[ALL]]==List,
Return[getMixingMatrix/@(DeleteCases[RE/@(x /. diracSub[ALL]),0])];
];
For[i=1,i<=Length[NameOfStates],
If[Head[DEFINITION[NameOfStates[[i]]][MatterSector]]===List,
If[FreeQ[Transpose[DEFINITION[NameOfStates[[i]]][MatterSector]][[2]],x]==False,
pos=Position[DEFINITION[NameOfStates[[i]]][MatterSector],x][[1]];
pos=Join[Drop[pos,-1],{Last[pos+1]}];
res=Extract[DEFINITION[NameOfStates[[i]]][MatterSector],pos];
];
];
i++;];
Return[res];
];


SelfEnergySum[y_]:=ShowSelfEnergy[y,True];
SelfEnergyList[y_]:=ShowSelfEnergy[y,False];

ShowSelfEnergy[y_,sum_]:=Block[{pos,field,i,states},
field = y;
For[i=1,i<=Length[NameOfStates],
If[FreeQ[ParticlesSelfEnergy1LoopSum[NameOfStates[[i]]],field]==False,
pos = Position[ParticlesSelfEnergy1LoopSum[NameOfStates[[i]]],field];
states = NameOfStates[[i]];
];
i++;];

If[Head[pos]===List,
If[sum==True,
Return[SelfEnergy1LoopSum[states][[pos[[1,1]]]]];,
Return[SelfEnergy1LoopList[states][[pos[[1,1]]]]];
];
Print["Self energy for ",y," does not exist!"];
];
];

TadpoleEquation[y_]:=Block[{pos,field,i,states},
If[FreeQ[diracFermions[ALL],y]==False,
field =  (y /. diracSub[ALL])[[1]];,
field = y;
];
For[i=1,i<=Length[NameOfStates],
If[Head[DEFINITION[NameOfStates[[i]]][VEVs]]===List,
If[FreeQ[DEFINITION[NameOfStates[[i]]][VEVs],field]==False,
pos = Position[DEFINITION[NameOfStates[[i]]][VEVs],field];
states = NameOfStates[[i]];
];
];
i++;];

If[Head[pos]===List,
Return[TadpoleEquations[states][[pos[[1,1]]]]==0];,
Print["Tadpole equation for ",y," does not exist!"];
];
];


Tadpole1LoopSum[y_]=ShowTadpole1Loop[y,True];
Tadpole1LoopList[y_]=ShowTadpole1Loop[y,False];

ShowTadpole1Loop[y_,sum_]:=Block[{pos,field,i,states},
If[FreeQ[diracFermions[ALL],y]==False,
field =  (y /. diracSub[ALL])[[1]];,
field = y;
];
For[i=1,i<=Length[NameOfStates],
If[Head[DEFINITION[NameOfStates[[i]]][VEVs]]===List,
If[FreeQ[DEFINITION[NameOfStates[[i]]][VEVs],field]==False,
pos = Position[DEFINITION[NameOfStates[[i]]][VEVs],field];
states = NameOfStates[[i]];
];
];
i++;];

If[Head[pos]===List,
If[sum==True,
Return[Tadpoles1LoopSum[states][[pos[[1,1]]]]];,
Return[Tadpoles1LoopList[states][[pos[[1,1]]]]];
];
Print["One loop tadpole for ",y," does not exist!"];
];
];

makeSumAll[expr_]:=Block[{i,erg,expand,summand},
expand=Expand[expr];
If[Head[expand]===Plus,
erg=List@@expand;
erg=makeSumAll/@erg;
Return[Plus@@erg];,
expand=expand*StillCalcSum;
];


sums=Cases[expand, x_?sumQ,3];
summand = DeleteCases[expand, x_?sumQ,3];

For[i=1,i<=Length[sums],
summand=Append[sums[[i]],summand] /. {sums[[i,1]] -> jnf[i]} ;
i++;];
Return[summand /. StillCalcSum->1 ];

];

sumQ[x_]:=If[Head[x]===sum,Return[True];,Return[False];];
inf[x_]:=ToExpression["i"<>ToString[x]];
jnf[x_]:=ToExpression["j"<>ToString[x]];




(* ::Input::Initialization:: *)
(* -------------------------------------------- *)
(* Structure Constant *)
(* -------------------------------------------- *)


(* ::Input::Initialization:: *)
(* Gell-Mann basis*)
Levi=Table[0,{8},{8},{8}];
Levi[[1,2,3]]=1; Levi[[3,1,2]]=1; Levi[[2,3,1]]=1; Levi[[3,2,1]]=-1; Levi[[2,1,3]]=-1;Levi[[1,3,2]]=-1;

Levi[[1,4,7]]=1/2; Levi[[7,1,4]]=1/2; Levi[[4,7,1]]=1/2; Levi[[1,7,4]]=-1/2; Levi[[7,4,1]]=-1/2;Levi[[4,1,7]]=-1/2;
Levi[[2,4,6]]=1/2; Levi[[6,2,4]]=1/2; Levi[[4,6,2]]=1/2; Levi[[2,6,4]]=-1/2; Levi[[6,4,2]]=-1/2; Levi[[4,2,6]]=-1/2;
Levi[[2,5,7]]=1/2; Levi[[7,2,5]]=1/2; Levi[[5,7,2]]=1/2; Levi[[2,7,5]]=-1/2; Levi[[7,5,2]]=-1/2; Levi[[5,2,7]]=-1/2;
Levi[[3,4,5]]=1/2; Levi[[5,3,4]]=1/2; Levi[[4,5,3]]=1/2; Levi[[3,5,4]]=-1/2; Levi[[5,4,3]]=-1/2; Levi[[4,3,5]]=-1/2;

Levi[[1,5,6]]=-1/2; Levi[[6,1,5]]=-1/2; Levi[[5,6,1]]=-1/2;  Levi[[1,6,5]]=1/2; Levi[[6,5,1]]=1/2; Levi[[5,1,6]]=1/2;
Levi[[3,6,7]]=-1/2; Levi[[7,3,6]]=-1/2; Levi[[6,7,3]]=-1/2; Levi[[3,7,6]]=1/2; Levi[[7,6,3]]=1/2; Levi[[6,3,7]]=1/2;

Levi[[4,5,8]]=Sqrt[3]/2; Levi[[8,4,5]]=Sqrt[3]/2; Levi[[5,8,4]]=Sqrt[3]/2; 
Levi[[4,8,5]]=-Sqrt[3]/2; Levi[[8,5,4]]=-Sqrt[3]/2;Levi[[5,4,8]]=-Sqrt[3]/2;
Levi[[6,7,8]]=Sqrt[3]/2; Levi[[8,6,7]]=Sqrt[3]/2; Levi[[7,8,6]]=Sqrt[3]/2; 
Levi[[6,8,7]]=-Sqrt[3]/2; Levi[[8,7,6]]=-Sqrt[3]/2; Levi[[7,6,8]]=-Sqrt[3]/2;

(* Basis of Susyno *)
Levi=I {{{0,0,0,0,0,0,0,0},{0,0,I/2,0,0,0,0,0},{0,-I/2,0,0,0,0,0,0},{0,0,0,0,0,0,(-I/2)*Sqrt[3],I/2},{0,0,0,0,0,-I/2,0,0},{0,0,0,0,I/2,0,0,0},{0,0,0,(I/2)*Sqrt[3],0,0,0,0},{0,0,0,-I/2,0,0,0,0}},{{0,0,-I/2,0,0,0,0,0},{0,0,0,0,0,0,0,0},{I/2,0,0,0,0,0,0,0},{0,0,0,0,0,I/2,0,0},{0,0,0,0,0,0,0,-I},{0,0,0,-I/2,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,I,0,0,0}},{{0,I/2,0,0,0,0,0,0},{-I/2,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,-I/2,0,0,0},{0,0,0,I/2,0,0,0,0},{0,0,0,0,0,0,(I/2)*Sqrt[3],I/2},{0,0,0,0,0,(-I/2)*Sqrt[3],0,0},{0,0,0,0,0,-I/2,0,0}},{{0,0,0,0,0,0,(I/2)*Sqrt[3],-I/2},{0,0,0,0,0,-I/2,0,0},{0,0,0,0,I/2,0,0,0},{0,0,0,0,0,0,0,0},{0,0,-I/2,0,0,0,0,0},{0,I/2,0,0,0,0,0,0},{(-I/2)*Sqrt[3],0,0,0,0,0,0,0},{I/2,0,0,0,0,0,0,0}},{{0,0,0,0,0,I/2,0,0},{0,0,0,0,0,0,0,I},{0,0,0,-I/2,0,0,0,0},{0,0,I/2,0,0,0,0,0},{0,0,0,0,0,0,0,0},{-I/2,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,-I,0,0,0,0,0,0}},{{0,0,0,0,-I/2,0,0,0},{0,0,0,I/2,0,0,0,0},{0,0,0,0,0,0,(-I/2)*Sqrt[3],-I/2},{0,-I/2,0,0,0,0,0,0},{I/2,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,(I/2)*Sqrt[3],0,0,0,0,0},{0,0,I/2,0,0,0,0,0}},{{0,0,0,(-I/2)*Sqrt[3],0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,(I/2)*Sqrt[3],0,0},{(I/2)*Sqrt[3],0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,(-I/2)*Sqrt[3],0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0}},{{0,0,0,I/2,0,0,0,0},{0,0,0,0,-I,0,0,0},{0,0,0,0,0,I/2,0,0},{-I/2,0,0,0,0,0,0,0},{0,I,0,0,0,0,0,0},{0,0,-I/2,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0}}};

dSU3matrix={{{0,0,0,0,0,0,1/(2 Sqrt[3]),1/2},{0,0,0,0,0,-(1/2),0,0},{0,0,0,0,-(1/2),0,0,0},{0,0,0,0,0,0,0,0},{0,0,-(1/2),0,0,0,0,0},{0,-(1/2),0,0,0,0,0,0},{1/(2 Sqrt[3]),0,0,0,0,0,0,0},{1/2,0,0,0,0,0,0,0}},{{0,0,0,0,0,-(1/2),0,0},{0,0,0,0,0,0,-(1/Sqrt[3]),0},{0,0,0,-(1/2),0,0,0,0},{0,0,-(1/2),0,0,0,0,0},{0,0,0,0,0,0,0,0},{-(1/2),0,0,0,0,0,0,0},{0,-(1/Sqrt[3]),0,0,0,0,0,0},{0,0,0,0,0,0,0,0}},{{0,0,0,0,-(1/2),0,0,0},{0,0,0,-(1/2),0,0,0,0},{0,0,0,0,0,0,1/(2 Sqrt[3]),-(1/2)},{0,-(1/2),0,0,0,0,0,0},{-(1/2),0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,1/(2 Sqrt[3]),0,0,0,0,0},{0,0,-(1/2),0,0,0,0,0}},{{0,0,0,0,0,0,0,0},{0,0,-(1/2),0,0,0,0,0},{0,-(1/2),0,0,0,0,0,0},{0,0,0,0,0,0,1/(2 Sqrt[3]),1/2},{0,0,0,0,0,1/2,0,0},{0,0,0,0,1/2,0,0,0},{0,0,0,1/(2 Sqrt[3]),0,0,0,0},{0,0,0,1/2,0,0,0,0}},{{0,0,-(1/2),0,0,0,0,0},{0,0,0,0,0,0,0,0},{-(1/2),0,0,0,0,0,0,0},{0,0,0,0,0,1/2,0,0},{0,0,0,0,0,0,-(1/Sqrt[3]),0},{0,0,0,1/2,0,0,0,0},{0,0,0,0,-(1/Sqrt[3]),0,0,0},{0,0,0,0,0,0,0,0}},{{0,-(1/2),0,0,0,0,0,0},{-(1/2),0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,1/2,0,0,0},{0,0,0,1/2,0,0,0,0},{0,0,0,0,0,0,1/(2 Sqrt[3]),-(1/2)},{0,0,0,0,0,1/(2 Sqrt[3]),0,0},{0,0,0,0,0,-(1/2),0,0}},{{1/(2 Sqrt[3]),0,0,0,0,0,0,0},{0,-(1/Sqrt[3]),0,0,0,0,0,0},{0,0,1/(2 Sqrt[3]),0,0,0,0,0},{0,0,0,1/(2 Sqrt[3]),0,0,0,0},{0,0,0,0,-(1/Sqrt[3]),0,0,0},{0,0,0,0,0,1/(2 Sqrt[3]),0,0},{0,0,0,0,0,0,1/Sqrt[3],0},{0,0,0,0,0,0,0,-(1/Sqrt[3])}},{{1/2,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,-(1/2),0,0,0,0,0},{0,0,0,1/2,0,0,0,0},{0,0,0,0,0,0,0,0},{0,0,0,0,0,-(1/2),0,0},{0,0,0,0,0,0,0,-(1/Sqrt[3])},{0,0,0,0,0,0,-(1/Sqrt[3]),0}}}

fSU3[a_,b_,c_]:=-fSU3[b,a,c]/;OrderedQ[{a,b}]==False
fSU3[a_,b_,c_]:=-fSU3[a,c,b]/;OrderedQ[{b,c}]==False
fSU3[a_,b_,c_]:=-fSU3[c,b,a]/;OrderedQ[{a,c}]==False

fSU2[a_,b_,c_]:=-fSU2[b,a,c]/;OrderedQ[{a,b}]==False
fSU2[a_,b_,c_]:=-fSU2[a,c,b]/;OrderedQ[{b,c}]==False
fSU2[a_,b_,c_]:=-fSU2[c,b,a]/;OrderedQ[{a,c}]==False

SetAttributes[dSU3,Orderless];
dSU3[a_Integer,b_Integer,c_Integer]:=dSU3matrix[[a,b,c]];

(*
TA[3,a_,b_,c_]:=Lam[a,b,c]/2;
TA[2,a_,b_,c_]:=Sig[a,b,c]/2;
*)

TA[SU[4],a_,b_,c_]:=LamPS[a,b,c]; 
TA[SU[3],a_,b_,c_]:=Lam[a,b,c]/2;
TA[SU[2],a_,b_,c_]:=Sig[a,b,c]/2;

TA[SU[n_],a_Integer,b_Integer,c_Integer]:=GeneratorMatrices[SU[n]][[a,b,c]]/2 /;n>4;

(* Generator[a_,_,1,_,_,_]:=0 /; a>1; *)
Generator[a_,_,1,_,_,_]:=0 /; a[[1]]>1;

fU1[a__]:=0;

FST[U[1]][a__]:=0;
FST[SU[2]][a__]:=fSU2[a];
FST[SU[3]][a__]:=fSU3[a];
FST[SU[4]][a__]:=fSU4[a];

MakeMatricesSUN[N_,old_]:=Block[{i,j,n1,n2,generators,sum},
generators = Table[0,{N^2-1},{N},{N}];

For[i=1,i<=Length[old],
For[n1=1,n1<=N-1,
For[n2=1,n2<=N-1,
generators[[i,n1,n2]]=old[[i,n1,n2]];
n2++;];
n1++;];
i++;];

j=1;

For[i=Length[old]+1,i<=N^2-2,
generators[[i,j,N]]=1;
generators[[i,N,j]]=1;
generators[[i+1,j,N]]=-I;
generators[[i+1,N,j]]=I;
j++;
i=i+2;];

sum=0;
For[i=1,i<=N-1,
generators[[N^2-1,i,i]]=1;
sum++;
i++;
];

generators[[N^2-1,N,N]]=-sum;
generators[[N^2-1]]=generators[[N^2-1]]/Sqrt[( sum^2 + N-1)/2];

GeneratorMatrices[SU[N]]=generators;

Return[generators];
];


(* ----------------------------------- *)
(* Metrik *)
(* ----------------------------------- *)

SetAttributes[g,Orderless];
g[1,1]:=-1;g[2,2]:=-1;g[3,3]:=-1;g[4,4]:=-1;
g[a_Integer,b_Integer]:=0 /; (a!= b);


(* ::Input::Initialization:: *)
GetNonZeroEntries[term_]:=Block[{sub={},pos,i,j,fac=1,epsilons, deltas, noSUN},
If[Head[term]===Times, temp= List@@term;, temp = {term}];

noSUN =Select[temp,(Head[Head[#]]==RM)&,5];
InvariantMatrix=Select[temp,(Head[Head[#]]==InvMat)&,5];
epsilons= Select[temp,(Head[#]==epsTensor) &,5];
deltas=Select[temp,(Head[#]==Delta) &,5];
For[i=1,i<=Length[noSUN],
pos=Position[SA`NonZeroEntries,noSUN[[i,0]]][[1,1]];
entry=Extract[SA`NonZeroEntries,pos];
sub=Join[sub,Flatten[Table[noSUN[[i,j]]->entry[[2,j]],{j,1,Length[entry[[2]]]}]]];
fac=fac*(noSUN[[i]]/.sub);
 i++;];

For[i=1,i<=Length[InvariantMatrix],
pos=Position[SA`NonZeroEntries,InvariantMatrix[[i,0]]][[1,1]];
entry=Extract[SA`NonZeroEntries,pos];
sub = Join[sub,Table[InvariantMatrix[[i,j]]->SA`NonZeroEntries[[pos,2,j]],{j,1,Length[entry[[2]]]}]];
fac=fac*(InvariantMatrix[[i]]/.sub);
i++;];

 If[Head[term]===Times,
temp=term;

While[FreeQ[temp,Delta[b_Symbol,a_Integer]]==False|| FreeQ[temp,Delta[a_Integer,b_Symbol]]==False,sub=Join[sub,DeleteCases[Select[List@@temp,FreeQ[#,Delta]==False&] /. Delta[a_Symbol,b_Symbol]->1 /. Delta[a_Integer,b_Symbol]->(b->a)/. Delta[b_Symbol,a_Integer]->(b->a),1]];
temp=temp/.sub;
deltas=Select[deltas /. sub,FreeQ[#,x_Integer]&];
];
];

sub = Join[sub,{Flatten[Table[Map[(#->1)&,List@@deltas[[i]]],{i,1,Length[deltas]}]]}];
sub = Join[sub,{Flatten[Table[Map[(#->Position[List@@epsilons[[i]],#][[1,1]])&,List@@epsilons[[i]]],{i,1,Length[epsilons]}]]}];


Return[{Flatten[sub],fac}];

];

SA`DimensionGG[x_,y_]:=SA`DimensionGG[(x/. diracSub[ALL])[[1]],y]/;FreeQ[diracFermions[ALL],x]==False


(*---------------------------*)
(* SU(4) Algebra *)
(*---------------------------*)

LambdaPS=Table[0,{15},{4},{4}];
LambdaPS[[1;;8,1;;3,1;;3]]=Lambda;
LambdaPS[[9,1,4]]=1;
LambdaPS[[9,4,1]]=1;
LambdaPS[[12,1,4]]=-I;
LambdaPS[[12,4,1]]=I;
LambdaPS[[10,4,2]]=1;
LambdaPS[[10,2,4]]=1;
LambdaPS[[13,2,4]]=-I;
LambdaPS[[13,4,2]]=I;
LambdaPS[[11,4,3]]=1;
LambdaPS[[11,3,4]]=1;
LambdaPS[[14,3,4]]=-I;
LambdaPS[[14,4,3]]=I;
LambdaPS[[15]]=DiagonalMatrix[{1,1,1,-3}]/Sqrt[6];


(*In the file MathSumMatrizes,there is a definition fSU4[a_Integer,b_Integer,c_Integer]:=fPS[[a,b,c]],so fPS should be a table!!*)
fPS=Table[-1/4*I Tr[ConjugateTranspose[LambdaPS[[a]]].(LambdaPS[[b]].LambdaPS[[c]]-LambdaPS[[c]].LambdaPS[[b]])],{a,1,15},{b,1,15},{c,1,15}];

(*Replace SU(4) generators by SU(3) ones and Kroneckers*)

LamPS[8+a_Symbol,b_Symbol,c_Symbol]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j1}]=={};
LamPS[11+a_Symbol,b_Symbol,c_Symbol]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j1}]=={};

LamPS[8+a_Symbol,b_Symbol,c_Symbol]:=0/;Complement[{a},{ct1,ct2,ct3,ct4}]=={}&&Complement[{b,c},{j1,j2,j3,j4}]=={};
LamPS[11+a_Symbol,b_Symbol,c_Symbol]:=0/;Complement[{a},{ct1,ct2,ct3,ct4}]=={}&&Complement[{b,c},{j1,j2,j3,j4}]=={};

(*Back to sef-adjoint generators*)
LamPS[8+a_Symbol,b_Symbol,4]:=1/2*Delta[b,a];
LamPS[8+a_Symbol,4,b_Symbol]:=1/2*Delta[b,a];

LamPS[11+a_Symbol,b_Symbol,4]:=-1/2*I*Delta[b,a];
LamPS[11+a_Symbol,4,b_Symbol]:=1/2*I*Delta[b,a];

LamPS[15,a_Symbol,b_Symbol]:=1/(2 Sqrt[6]) Delta[a,b];LamPS[15,4,a_Symbol]:=0;LamPS[15,a_Symbol,4]:=0;

LamPS[a_,b_,c_]:=Lam[a,b,c]/2/;(a===col1||a===col2||a===col3||a===col4);

(*what is zero for sure*)
LamPS[11+col3,col1,col2]=0;
LamPS[11+col3,col2,col1]=0;
LamPS[8+col3,col2,col1]=0;
LamPS[8+col3,col1,col2]=0;
Delta[4,col1]=0;
Delta[4,col1b]=0;
Delta[4,col2]=0;
Delta[4,col2b]=0;
Delta[4,col3]=0;
Delta[4,col3b]=0;
LamPS[8+a_,4,4]=0;
LamPS[11+a_,4,4]=0;

Lam[a_,4,b_]:=0;
Lam[a_,b_,4]:=0;

sum[a_,1,3,Lam[b_,a_,a_]]:=0;

sum[j1,1,15,fSU4[j1,c1_,a_Integer+c3_] fSU4[j1,c2_,b_Integer+c4_]]:=sum[j2,1,8,fSU4[j2,c1,a+c3] fSU4[j2,c2,b+c4]]+sum[j2,1,3,fSU4[8+j2,c1,a+c3] fSU4[8+j2,c2,b+c4]]
+sum[j2,1,3,fSU4[11+j2,c1,a+c3] fSU4[11+j2,c2,b+c4]]/;Complement[{c1,c2,c3,c4},{ct1,ct2,ct3,ct4}]=={}

sum[j1,1,15,fSU4[j1,a_Integer+c1_,b_Integer] fSU4[j1,c2_+c_Integer,d_Integer]]:=sum[j2,1,8,fSU4[j2,a+c1,b] fSU4[j2,c2+c,d]]+sum[j2,1,3,fSU4[j2+8,a+c1,b] fSU4[j2+8,c2+c,d]]+sum[j2,1,3,fSU4[j2+11,a+c1,b] fSU4[j2+11,c2+c,d]]+fSU4[15,a+c1,b] fSU4[15,c2+c,d]/;Complement[{c1,c2},{ct1,ct2,ct3,ct4}]=={}


sum[j1,1,15,fSU4[j1,c1_,c3_] fSU4[j1,a_Integer+c2_,b_Integer+c4_]]:=sum[j2,1,8,fSU4[j2,c1,c3] fSU4[j2,a+c2,b+c4]]+sum[j2,1,3,fSU4[8+j2,c1,c3] fSU4[8+j2,a+c2,b+c4]]
+sum[j2,1,3,fSU4[11+j2,c1,c3] fSU4[11+j2,a+c2,b+c4]]/;Complement[{c1,c2,c3,c4},{ct1,ct2,ct3,ct4}]=={}


sum[j1,1,15,fSU4[j1,c1_,c3_] fSU4[j1,c2_,c4_]]:=sum[j2,1,8,fSU3[j2,c1,c3] fSU3[j2,c2,c4]]/;Complement[{c1,c2,c3,c4},{ct1,ct2,ct3,ct4}]=={};


fSU4[a_Symbol,b_Symbol,c_Symbol+8]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[a_Symbol,b_Symbol,c_Symbol+11]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2}]=={};

fSU4[g_Symbol,8+a_Symbol,8+b_Symbol]:=I (Lam[g,a,b]/4-conj[Lam[g,a,b]/4])/;Complement[{a,b,g},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[g_Symbol,11+a_Symbol,11+b_Symbol]:=I (Lam[g,a,b]/4-conj[Lam[g,a,b]/4])/;Complement[{a,b,g},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[g_Symbol,8+a_Symbol,11+b_Symbol]:=-Lam[g,a,b]/4-conj[Lam[g,a,b]/4]/;Complement[{a,b,g},{ct1,ct2,ct3,ct4,j2}]=={};


(*a,b color indices*)
fSU4[8+a_Symbol,8+b_Symbol,15]:=0/;Complement[{a,b},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[11+a_Symbol,11+b_Symbol,15]:=0/;Complement[{a,b},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[8+a_Symbol,11+b_Symbol,15]:=Sqrt[2/3]*Delta[a,b]/;Complement[{a,b},{ct1,ct2,ct3,ct4,j2}]=={};

(*a,b color indices*)
fSU4[8+a_Symbol,8+b_Symbol,14+c_Symbol]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2,col1}]=={};
fSU4[11+a_Symbol,11+b_Symbol,14+c_Symbol]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2,col1}]=={};
fSU4[8+a_Symbol,11+b_Symbol,14+c_Symbol]:=Sqrt[2/3]*Delta[a,b]*Delta[c,1]/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[8+a_Symbol,11+b_Symbol,14+c_Symbol]:=Sqrt[2/3]*Delta[a,b]/;(Complement[{a,b},{ct1,ct2,ct3,ct4,j2}]=={}&&c===col1);

(*a,b,c color indices running from 1 to 3*)
fSU4[8+a_Symbol,8+b_Symbol,8+c_Symbol]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[8+a_Symbol,8+b_Symbol,11+c_Symbol]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[8+a_Symbol,11+b_Symbol,11+c_Symbol]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[11+a_Symbol,11+b_Symbol,11+c_Symbol]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2}]=={};

fSU4[a_Symbol,8+c_Symbol,15]:=-Sqrt[2/3]*(Delta[a,12]*Delta[c,1]+Delta[a,13]*Delta[c,2]+Delta[a,14]*Delta[c,3])/;Complement[{a,c},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[a_Symbol,11+c_Symbol,15]:=Sqrt[2/3]*(Delta[a,9]*Delta[c,1]+Delta[a,10]*Delta[c,2]+Delta[a,11]*Delta[c,3])/;Complement[{a,c},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[a_Symbol,8+c_Symbol,14+b_Symbol]:=-Sqrt[2/3]*Delta[b,1]*(Delta[a,12]*Delta[c,1]+Delta[a,13]*Delta[c,2]+Delta[a,14]*Delta[c,3])/;Complement[{a,c},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[a_Symbol,11+c_Symbol,14+b_Symbol]:=Sqrt[2/3]*Delta[b,1]*(Delta[a,9]*Delta[c,1]+Delta[a,10]*Delta[c,2]+Delta[a,11]*Delta[c,3])/;Complement[{a,c},{ct1,ct2,ct3,ct4,j2}]=={};



(*multiple 15*)
fSU4[a_Symbol,15,15]=0;
fSU4[a_Symbol,b_Symbol,15]:=0/;Complement[{a,b},{ct1,ct2,ct3,ct4,j2,j1}]=={};
(*H*)(*This is not true e.g.for a=9,b=12. Can not j2 and j1 have these values??*)
fSU4[a_Symbol,14+b_Symbol,15]:=0/;Complement[{a,b},{ct1,ct2,ct3,ct4,j2,j1,col1}]=={};
fSU4[a_Plus,15,15]=0;
fSU4[a_Symbol,14+b_Symbol,14+c_Symbol]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[a_Plus,14+b_Symbol,14+c_Symbol]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2}]=={};
fSU4[a_Symbol,b_Symbol,14+c_Symbol]:=0/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2,col1}]=={};
(*H*)(*The same remark as above*)

fSU4[a_Symbol,b_Symbol,c_Symbol]:=fSU3[a,b,c]/;Complement[{a,b,c},{ct1,ct2,ct3,ct4,j2}]=={};


fSU4[a_,b_,c_]:=-fSU4[b,a,c]/;((Head[a]===Plus&&Head[b]===Symbol)||(Head[a]===Plus&&Head[b]===Plus&&OrderedQ[{a[[1]],b[[1]]}]==False)||(a==15&&(Head[b]===Plus||Head[b]===Symbol)));
fSU4[a_,b_,c_]:=-fSU4[a,c,b]/;((Head[b]===Plus&&Head[c]===Symbol)||(Head[b]===Plus&&Head[c]===Plus&&OrderedQ[{b[[1]],c[[1]]}]==False)||(b==15&&(Head[c]===Plus||Head[c]===Symbol)));
fSU4[a_,b_,c_]:=-fSU4[c,b,a]/;((Head[a]===Plus&&Head[c]===Symbol)||(Head[a]===Plus&&Head[c]===Plus&&OrderedQ[{a[[1]],c[[1]]}]==False)||(a==15&&(Head[c]===Plus||Head[c]===Symbol)));





