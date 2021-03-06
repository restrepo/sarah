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
(* ---------------------------------------------------- *)
(* Functions to link Susyno by Renato Fonseca to SARAH *)
(* ---------------------------------------------------- *)

InitSusyno:=Block[{},
Print["******************************************************* "];
Print["Loading ",StyleForm["Susyno","Section",FontSize->10]," functions for the handling of Lie Groups "];
Print["Based on Susyno v.2.0 by Renato Fonseca (1106.5016)"];
Print["webpage: ",StyleForm["web.ist.utl.pt/renato.fonseca/susyno.html","Section",FontSize->10]];
Print["******************************************************* "];

Get[ToFileName[$sarahSusynoDir,"LieGroups_SARAH.m"]];

];

CheckSusynoGaugeInvariant[fields_,group_]:=Block[{reps={},pos,i,res},
For[i=1,i<=Length[fields],
pos=Position[Fields,fields[[i]]][[1,1]];
reps=Join[reps,{getDynkinLabels[Fields[[pos,3+group]],Gauge[[group,2]]]}];
i++;];
(* res=(Apply[Inv[SusynoForm[Gauge[[group,2]]]],reps] /. Inv[a_][b__]\[Rule]Inv[a,b]/. Inv\[Rule]Invariants); *)
reps=DeleteCases[reps,{0}];
res=Invariants[SusynoForm[Gauge[[group,2]]],reps];
If[res=={} && reps=!={},
Return[False];,
Return[True];
];
];

InvariantMatrixSusyno[group_,dim_]:=Block[{i,j,dimTemp={},subName={},dims,reps,result,factored,repsNC, temp, list, prefactor, subSU2={},conjugations={},sign},
reps=DeleteCases[dim,{0},3];
If[reps==={},
Return[1];,
dims=Table[DimR[SusynoForm[group],Abs[reps[[i]]]],{i,1,Length[reps]}];
repsNC=Abs/@reps;
(*
If[group=!=SU[2] || (Length[reps]\[Equal]2 && reps[[1]]==={2} && reps[[2]]==={2}),
reps[[-1]]=ConjugatedRep[reps[[-1]],group];
temp=(Append[Apply[Inv[SusynoForm[group]],reps],True] /. Inv[a_][b__]\[Rule]Inv[a,b]/. Inv\[Rule]Invariants);, 
If[group===SU[2] && reps[[1]]==={-1},
reps=Abs[reps];
temp=(Append[Apply[Inv[SusynoForm[group]],reps],True] /. Inv[a_][b__]\[Rule]Inv[a,b]/. Inv\[Rule]Invariants);, 
temp=(Apply[Inv[SusynoForm[group]],reps] /. Inv[a_][b__]\[Rule]Inv[a,b]/. Inv\[Rule]Invariants);  
];
]; *)
If[group===SU[2],
For[i=1,i<=Length[reps],
If[reps[[i]]==={-1},
subSU2=Join[subSU2,{NF[i][1]->NF[i][2],NF[i][2]->NF[i][1]}];
];
i++;];
subSU2=subSU2/.{NF[1]->a,NF[2]->b,NF[3]->c,NF[4]->d};
subSU2={};
];
For[i=1,i<=Length[reps],
If[reps[[i,1]]<0,conjugations=Join[conjugations,{True}];,conjugations=Join[conjugations,{False}];];
i++;];
If[Length[reps]===4,
temp=Get4Invariants[group,repsNC];
If[FreeQ[temp,CG]==False || FreeQ[temp,Delta]==False ,
If[temp=!={},
SA`RnR++;
Off[Part::"pspec"];
Off[Part::"pkspec1"];
ReleaseHold[Hold[Set[CG[group,repsNC][i1_,i2_,i3_,i4_],RHS]]/. RHS -> temp[[1]] ];
ReleaseHold[Hold[Set[CG[group,Reverse/@repsNC][i1_,i2_,i3_,i4_],RHS]]/. RHS -> temp[[1]] ];
ReleaseHold[Hold[Set[InvMat[SA`RnR-1][i1_,i2_,i3_,i4_],RHS]]/. RHS -> temp[[2]] ];
On[Part::"pspec"]; 
On[Part::"pkspec1"];
Return[InvMat[SA`RnR-1]];,
LagInput::ZeroCoupling="The contraction `` vanishes";
Message[LagInput::ZeroCoupling,dim];
];
];,
temp=Invariants[SusynoForm[group],Abs/@reps,Conjugations->conjugations];
];
If[temp==={} || Head[temp]===InvariantsBaseMethod,
Susyno::CGfailed="There has been a problem with calculating the Clebsch-Gordon coefficienty for `` in (``)";
Message[Susyno::CGfailed,reps,group];
Return[];,
temp=temp[[1]];
];
temp=temp/.subSU2;
list=(List@@Expand[temp]) /. a_[b_Integer]->1;
prefactor=Sqrt[Plus@@(list*Conjugate[list])/Max[dims]];
temp=Simplify[temp/prefactor];
Switch[Length[reps],
2,
result=Table[Coefficient[temp,a[i]b[j]],{i,1,dims[[1]]},{j,1,dims[[2]]}];,
3,
result=Table[Coefficient[temp,a[i]b[j]c[k]],{i,1,dims[[1]]},{j,1,dims[[2]]},{k,1,dims[[3]]}];,
4,
temp =2*temp;
result=Table[Coefficient[temp,a[i]b[j]c[k] d[l]],{i,1,dims[[1]]},{j,1,dims[[2]]},{k,1,dims[[3]]},{l,1,dims[[4]]}];
];
sign=Sign[DeleteCases[Flatten[result],0][[1]]];
(* result=sign*result; *)


 SA`NonZeroEntries = Join[SA`NonZeroEntries,{{InvMat[SA`RnR], Take[Position[result,x_?((Abs[#]=!=0 && NumberQ[#])&)][[1]],{1,Length[reps]}]}}];

Off[Part::"pspec"];
ReleaseHold[Hold[Set[LHS[a__Integer],RHS[[a]]]]/. LHS -> InvMat[SA`RnR] /. RHS -> result ];
(*
ReleaseHold[Hold[Set[LHS[a__Integer],RHS[a]]]/. RHS \[Rule] InvMat[SA`RnR] /. LHS \[Rule] CG[group,repsNC] ];
ReleaseHold[Hold[Set[LHS[a__Integer],RHS[a]]]/. RHS \[Rule] InvMat[SA`RnR] /. LHS \[Rule] CG[group,Reverse/@repsNC] ];
*)
ReleaseHold[Hold[Set[LHS[a__Integer],RHS[a]]]/. RHS -> InvMat[SA`RnR] /. LHS -> CG[group,reps] ];
ReleaseHold[Hold[Set[LHS[a__Integer],RHS[a]]]/. RHS -> InvMat[SA`RnR] /. LHS -> CG[group,Reverse/@reps] ];
(* subCGCBroken=Join[subCGCBroken,{CG[group,repsNC] ->InvMat[SA`RnR]}]; *)
On[Part::"pspec"];
SA`RnR++; 

(*
SA`ClebschGordon=Join[SA`ClebschGordon,{{CG[group,repsNC],result}}];
SA`KnonwCG=Join[SA`KnonwCG,{CG[group,repsNC]}];
CheckSymmetryCG[CG[group,repsNC]];
*)

SA`ClebschGordon=Join[SA`ClebschGordon,{{CG[group,reps],result}}];
SA`KnonwCG=Join[SA`KnonwCG,{CG[group,reps]}];
CheckSymmetryCG[CG[group,reps]];



If[Length[reps]===2 && reps[[1]]===reps[[2]] && reps[[2]]=!=repsNC[[2]],
CG[group,repsNC][a_,b_]=Delta[a,b];,
If[Length[reps]===group[[1]] && group[[0]]===SU  && Intersection[repsNC]==={Join[{1},Table[0,{group[[1]]-2}]]},
CG[group,repsNC][a___]=epsTensor[a];
];
];


Return[InvMat[SA`RnR-1]];
];

];

Get4Invariants[groups_,reps_]:=Block[{i,t,p,t1,t2,Found=False,fields},
p=Intersection[Map[Sort[#]&,Permutations[{1,2,3,4}] /. {a_,b_,c_,d_}->{{a,b},{c,d}},{2}]];
fields={a,b,c,d};
i=1;
While[i<=Length[p] && Found==False,
t1=CheckInvariants[groups,{reps[[p[[i,1,1]]]],reps[[p[[i,1,2]]]]}] /. {a->fields[[p[[i,1,1]]]],b->fields[[p[[i,1,2]]]]};
t2=CheckInvariants[groups,{reps[[p[[i,2,1]]]],reps[[p[[i,2,2]]]]}]/. {a->fields[[p[[i,2,1]]]],b->fields[[p[[i,2,2]]]]};
If[t1=!={} && t2 =!={},
Found=True;,
i++;
];
];
InvariantMatrixSusyno[groups,{reps[[p[[i,1,1]]]],reps[[p[[i,1,2]]]]}];
InvariantMatrixSusyno[groups,{reps[[p[[i,2,1]]]],reps[[p[[i,2,2]]]]}];
Return[{CG[groups,{reps[[p[[i,1,1]]]],reps[[p[[i,1,2]]]]}][fields[[p[[i,1,1]]]],fields[[p[[i,1,2]]]]]*CG[groups,{reps[[p[[i,2,1]]]],reps[[p[[i,2,2]]]]}][fields[[p[[i,2,1]]]],fields[[p[[i,2,2]]]]],InvMat[SA`RnR-2][fields[[p[[i,1,1]]]],fields[[p[[i,1,2]]]]] InvMat[SA`RnR-1][fields[[p[[i,2,1]]]],fields[[p[[i,2,2]]]]]} /. {a->i1,b->i2,c->i3,d->i4}];
(* Return[t1*t2]; *)
];

CheckInvariants[group_,repIN_]:=Block[{temp,reps},
reps=repIN;
(*
If[group=!=SU[2] || (Length[reps]\[Equal]2 && reps[[1]]==={2} && reps[[2]]==={2}),
reps[[-1]]=ConjugatedRep[reps[[-1]],group];
temp=(Append[Apply[Inv[SusynoForm[group]],reps],True] /. Inv[a_][b__]\[Rule]Inv[a,b]/. Inv\[Rule]Invariants);, 
If[group===SU[2] && reps[[1]]==={-1},
reps=Abs[reps];
temp=(Append[Apply[Inv[SusynoForm[group]],reps],True] /. Inv[a_][b__]\[Rule]Inv[a,b]/. Inv\[Rule]Invariants);, 
temp=(Apply[Inv[SusynoForm[group]],reps] /. Inv[a_][b__]\[Rule]Inv[a,b]/. Inv\[Rule]Invariants);  
];
]; *)
temp=Invariants[SusynoForm[group],Abs/@reps];
Return[temp];
];



getDynkinLabelsSusyno[group_,dim_]:=Block[{reps,i,j,dyns},
reps=repsWithSizeN[group,Abs[dim]];
If[Length[reps]>2,
dyns=DynkinIndex[group,#]&/@reps;
min=Position[reps,Min[dyns]];
reps=Table[reps[[min[[i,1]]]],{i,1,Length[min]}];
];
congr=CongruencyClass[group,#]&/@reps;
min=Position[congr,Min[congr]];
max=Position[congr,Max[congr]];
If[Length[min]===1,
If[dim>0,
Return[reps[[min[[1,1]] ]]],
Return[reps[[max[[1,1]]]]]
];,
digits=ToExpression[StringReplace[ToString[#],{" "->"",","->""}]]&/@reps;
min=Position[digits,Min[digits]];
max=Position[digits,Max[digits]];
If[dim>0,
Return[reps[[min[[1,1]] ]]],
Return[reps[[max[[1,1]]]]]
];
];
];


SA`NeededInvariantsSusyno={};
SA`NeededGeneratorsSusyno={};


(* ::Input::Initialization:: *)
SusynoForm[SU[x_]]:=ToExpression["SU"<>ToString[x]];
SusynoForm[SO[x_]]:=ToExpression["SO"<>ToString[x]];
SusynoForm[E[x_]]:=ToExpression["E"<>ToString[x]];
SusynoForm[F[x_]]:=ToExpression["F"<>ToString[x]];
SusynoForm[G[x_]]:=ToExpression["G"<>ToString[x]];
SusynoForm[SP[x_]]:=ToExpression["SP"<>ToString[x]];


(* ::Input::Initialization:: *)
GetInformationSusyno[Nr_,k_]:=Block[{i,resSusyno,temp},
resSusyno = CallSusyno[Fields[[Nr,k+3]],Gauge[[k,2]]];
MakeGroupConstants[Nr,k,resSusyno[[2]],resSusyno[[3]],resSusyno[[4]],resSusyno[[5]]];
Generator[Gauge[[k,2]],k,FieldDim[Nr,k],lor_,p1_,p2_]=(Hold[TA[DIMGAUGE,DIM,genf[lor],listIndizes[[GAUGE,1]]/.subGC[p1],listIndizes[[GAUGE,1]]/.subGC[p2]]] /. {DIMGAUGE -> Gauge[[k,2]],DIM->FieldDim[Nr,k],GAUGE->k});

SA`NeededGeneratorsSusyno= Join[SA`NeededGeneratorsSusyno,{{Gauge[[k,2]],FieldDim[Nr,k],DynkinLabels[Gauge[[k,2]],Fields[[Nr,3]]]}}];

temp= {Gauge[[k,3]]};
For[i=1,i<=Length[temp],
If[Gauge[[k,5]]==False,
notShort = Join[notShort,{ToExpression[ToString[temp[[i]]]<>appendIndex[[i]]]}];,
expShort = Join[expShort,{ToExpression[ToString[temp[[i]]]<>appendIndex[[i]]]}];
];
i++;];
NonSUNindices=Intersection[Join[NonSUNindices,{Gauge[[k,3]]}]];
DynkinLabels[Gauge[[k,2]],Fields[[Nr,3]]]=resSusyno[[6]];
ConjDynkinLabels[Gauge[[k,2]],Fields[[Nr,3]]]=ConjResSusyno[[6]];
If[FieldDim[Nr,k]<0 && Head[Fields[[Nr,k+3]]]=!=List, temp = - temp;];
If[Gauge[[k,5]]==False,
notExpanded=Join[notExpanded,temp];,
expanded=Join[expanded,temp];
];
];





(* ::Input::Initialization:: *)
CallSusyno[rep_,group_]:=Block[{dim,dimS,dynkin,temp,pos,checkvariableexistsSARAH,DL},
If[SusynoLoaded=!=True,
Message[SARAH::UnknownGaugeGroup,group];
Interrupt[];,
If[Head[rep]===List,dimS=rep[[1]]; dynkin=rep[[2]];,dimS=rep; dynkin=None];
dim=Abs[dimS];
temp = SARAHCheckIrrep[dim,{ToString[Head[group]],group[[1]]}];
If[dynkin===None && Length[temp]<= 2,
If[dim==dimS,
If[Length[temp]==1,ConjResSusyno=temp[[1]];,ConjResSusyno=temp[[2]];];
 Return[temp[[1]]];,
ConjResSusyno=temp[[1]]; 
Return[temp[[2]]];
];,
If[dynkin===None && Length[temp]> 2, 
Message[SARAH::DimensionNotUnique,dim, group];,
pos = Position[temp,dynkin];
If[pos==={};
Message[SARAH::UnknownDynkin,dynkin];,
ConjResSusyno=Delete[Position[temp,temp[[pos[[1,1,4]]]]],pos[[1,1]]];
Return[temp[[pos[[1,1]]]]];
];
];
];
];
];


GeneratInvariantMatrixSusyno[IndexTypesNonSUN_,partList_]:=Block[{resNonSUN,pos,tepm,i,j,dyn,ind},

resNonSUN=1;
For[i=1,i<=Length[IndexTypesNonSUN],
pos = Position[Gauge,IndexTypesNonSUN[[i]]][[1,1]];
temp={}; dyn={}; ind={};
For[j=1,j<=Length[partList],
pos2=Position[Fields,partList[[j]]][[1,1]];
If[FieldDim[pos2,pos]=!=1,
temp = Join[temp,{FieldDim[pos2,pos]}];
dyn = Join[dyn,{DynkinLabels[Gauge[[pos,2]],Fields[[pos2,3]]]}];
ind=Join[ind,{IndexTypesNonSUN[[i]] /. subGC[j]}];
];
j++;];
temp=DeleteCases[temp,1,5];
resNonSUNtemp=RM[Gauge[[pos,2]],temp,dyn]@@ind;

SA`NeededInvariantsSusyno = Join[SA`NeededInvariantsSusyno,{{Gauge[[pos,2]],temp,dyn,IndexTypesNonSUN[[i]]}}];
resNonSUN = resNonSUN*resNonSUNtemp;
i++];

Return[resNonSUN];
];

NumberStates[x_,y_]:=NumberStates[x,y//. (a_[{b__}]->a)]/;FreeQ[y,List]==False;

GenerateSusyNoInvariants:=Block[{i,j,temp,pos},
If[SusynoLoaded==True,
PrintDebug["Get information from Susyno"];
DynamicInitGaugeG="Get information from Susyno";
SA`NeededInvariantsSusyno = Intersection[SA`NeededInvariantsSusyno];
SA`NeededGeneratorsSusyno = Intersection[SA`NeededGeneratorsSusyno];
SA`NonZeroEntries={};

For[i=1,i<=Length[SA`NeededGeneratorsSusyno],
entry = SA`NeededGeneratorsSusyno[[i]];
temp = Normal/@RepMatrices[SusynoForm[entry[[1]]],entry[[3]]];
ReleaseHold[Hold[SetDelayed[TA[entry[[1]],entry[[2]],x_Integer,y_Integer,z_Integer],TEMP[[x,y,z]]]]/.TEMP->temp];
pos=Take[Position[temp,_?((#=!=0)&&NumericQ[#]&),6,1][[1]],{1,3}];
SA`NonZeroEntries = Join[SA`NonZeroEntries,{{TA[entry[[1]],entry[[2]],_,_,_],pos}}];
i++;];


For[i=1,i<=Length[SA`NeededInvariantsSusyno],
entry=SA`NeededInvariantsSusyno[[i]];
Switch[Length[entry[[2]]],
2,
	temp = Invariants[SusynoForm[entry[[1]]],entry[[3,1]],entry[[3,2]]][[1]];
	temp = Table[Coefficient[temp,a[i1] b[i2]],{i1,1,entry[[2,1]]},{i2,1,entry[[2,2]]}];
	ReleaseHold[Hold[SetDelayed[RM[entry[[1]],entry[[2]],entry[[3]]][x_Integer,y_Integer],TEMP[[x,y]]]]/.TEMP->temp];
	pos=Take[Position[temp,_?((#=!=0)&&NumericQ[#]&),6,1][[1]],{1,2}];
	SA`NonZeroEntries = Join[SA`NonZeroEntries,{{RM[entry[[1]],entry[[2]],entry[[3]]],pos,entry[[4]]}}];,
3,
	temp = Invariants[SusynoForm[entry[[1]]],entry[[3,1]],entry[[3,2]],entry[[3,3]]][[1]];
	temp = Table[Coefficient[temp,a[i1] b[i2] c[3]],{i1,1,entry[[2,1]]},{i2,1,entry[[2,2]]},{i3,1,entry[[2,3]]}];
	ReleaseHold[Hold[SetDelayed[RM[entry[[1]],entry[[2]],entry[[3]]][x_Integer,y_Integer,z_Integer],TEMP[[x,y,z]]]]/.TEMP->temp];
	pos=Take[Position[temp,_?((#=!=0)&&NumericQ[#]&),6,1][[1]],{1,3}];
	SA`NonZeroEntries = Join[SA`NonZeroEntries,{{RM[entry[[1]],entry[[2]],entry[[3]]],pos,entry[[4]]}}];
];
i++;];

For[i=1,i<=Length[Gauge],
If[Head[Gauge[[i,2]]]=!=SU && Head[Gauge[[i,2]]]=!=U,
For[j=1,j<=Length[Fields],
temp = Invariants[SusynoForm[Gauge[[i,2]]],DynkinLabels[Gauge[[i,2]],Fields[[j,3]]],ConjDynkinLabels[Gauge[[i,2]],Fields[[j,3]]]][[1]];
temp = Table[Coefficient[temp,a[i1] b[i2]],{i1,1,entry[[2,1]]},{i2,1,entry[[2,2]]}];
ReleaseHold[Hold[SetDelayed[RM[Gauge[[i,2]],FieldDim[j,i],DynkinLabels[Gauge[[i,2]],Fields[[j,3]]]][x_Integer,y_Integer],TEMP[[x,y]]]]/.TEMP->temp];
pos=Take[Position[temp,_?((#=!=0)&&NumericQ[#]&),6,1][[1]],{1,2}];
SA`NonZeroEntries = Join[SA`NonZeroEntries,{{RM[Gauge[[i,2]],FieldDim[j,i],DynkinLabels[Gauge[[i,2]],Fields[[j,3]]]],pos,Gauge[[i,2]]}}];
j++;];
];
i++;];
];
];



GenerateNoSUNsub[term_,length_]:=Block[{sub={},pos,i,fca},
If[Head[term]===Times,
temp=Select[List@@term,(Head[Head[#]]==RM)&,5];,
temp=Select[{term},(Head[Head[#]]==RM)&,5];
];
fac=1;
For[i=1,i<=Length[temp],pos=Position[SA`NonZeroEntries,temp[[i,0]]][[1,1]];
entry=Extract[SA`NonZeroEntries,pos];
sub=Join[sub,Flatten[Table[(entry[[3]]/.subGC[j])->entry[[2,j]],{j,1,length}]]];
fac=fac*(temp[[i]]/.sub) i++;];
Return[{sub,fac}];];

CheckSymmetryCG[CG_]:=Block[{i,reps,repsDoub,group,pos,j,k,sign},
reps=CG[[2]];
group=CG[[1]];
repsDoub=Intersection[Select[reps,(Count[reps,#]>1)&]];
If[repsDoub==={},Return[];];
Switch[Length[reps],
2,
	If[Length[Intersection[Table[CG[i,i],{i,1,DimR[SusynoForm[group],repsDoub[[1]]]}]]]>1,
	CG[a_,b_]:= CG[b,a] /;(OrderedQ[{a,b}]==False);,
	CG[a_,b_]:= -CG[b,a] /;(OrderedQ[{a,b}]==False);
	];,
3,
For[j=1,j<=Length[repsDoub],
pos=Position[reps,repsDoub[[j]]];
Switch[Length[pos],
2,
Switch[pos,
{{1},{2}},
If[Length[Intersection[Flatten[Table[CG[i,i,k],{i,1,DimR[SusynoForm[group],repsDoub[[j]]]},{k,1,DimR[SusynoForm[group],reps[[3]]]}]]]]>1,
CG[a_,b_,c_]:= CG[b,a,c] /;(OrderedQ[{a,b}]==False);,
CG[a_,b_,c_]:=- CG[b,a,c] /;(OrderedQ[{a,b}]==False);
];,
{{1},{3}},
If[Length[Intersection[Flatten[Table[CG[i,k,i],{i,1,DimR[SusynoForm[group],repsDoub[[j]]]},{k,1,DimR[SusynoForm[group],reps[[2]]]}]]]]>1,
CG[a_,c_,b_]:= CG[b,c,a] /;(OrderedQ[{a,b}]==False);,
CG[a_,c_,b_]:=-CG[b,c,a] /;(OrderedQ[{a,b}]==False);
];,
{{2},{3}},
If[Length[Intersection[Flatten[Table[CG[k,i,i],{i,1,DimR[SusynoForm[group],repsDoub[[j]]]},{k,1,DimR[SusynoForm[group],reps[[1]]]}]]]]>1,
CG[c_,a_,b_]:= CG[c,b,a] /;(OrderedQ[{a,b}]==False);,
CG[c_,a_,b_]:=- CG[c,b,a] /;(OrderedQ[{a,b}]==False);
];
];,
3,
If[Length[Intersection[Flatten[Table[CG[i,i,k],{i,1,DimR[SusynoForm[group],repsDoub[[j]]]},{k,1,DimR[SusynoForm[group],reps[[3]]]}]]]]>1,
CG[c_,a_,b_]:= CG[c,b,a] /;(OrderedQ[{a,b}]==False);
CG[a_,c_,b_]:= CG[b,c,a] /;(OrderedQ[{a,b}]==False);
CG[a_,b_,c_]:= CG[b,a,c] /;(OrderedQ[{a,b}]==False);,
CG[c_,a_,b_]:= -CG[c,b,a] /;(OrderedQ[{a,b}]==False);
CG[a_,c_,b_]:= -CG[b,c,a] /;(OrderedQ[{a,b}]==False);
CG[a_,b_,c_]:= -CG[b,a,c] /;(OrderedQ[{a,b}]==False);
];
];
j++;];
];

];


