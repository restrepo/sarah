(*******************************************************************
This file was generated automatically by the Mathematica front end.
It contains Initialization cells from a Notebook file, which
typically will have the same name as this file except ending in
".nb" instead of ".m".

This file is intended to be loaded into the Mathematica kernel using
the package loading commands Get or Needs.  Doing so is equivalent
to using the Evaluate Initialization Cells menu command in the front
end.

DO NOT EDIT THIS FILE.  This entire file is regenerated
automatically each time the parent Notebook file is saved in the
Mathematica front end.  Any changes you make to this file will be
overwritten.
***********************************************************************)

(* ---------------------------------- *)
(* 
  Sum Properties *)
(* ---------------------------------- *)



sum[a_,b_,0]:=0;
sum[a_Integer,b_,c_]:=1 /; (a \[GreaterEqual] b && a \[LessEqual] c );
sum[a_Integer,b_,c_]:=0 /; (a < b );
sum[a_Integer,b_,c_]:=0/; (a > c );
sum[a_,b_,c_,d_] :=sum[a,1,c-b+1,d /. a \[Rule] a+b-1] /; (b \[NotEqual] 1)
sum[a_,b_,b_]:=Delta[a,b];
sum[a_,1,ende_,sum[b_,1,ende_,fak1_]fak2_]:=
    sum[a,1,ende, 
        fak2* (fak1 /. b \[Rule]a)] /;(( 
            FreeQ[fak1,Delta[a,b]]\[Equal]False) || ( 
            FreeQ[fak1, Delta[b,a]]\[Equal]False));
sum[a_,b_Integer,c_Integer]:=0 /;  (b>c)
sum[a_,b_,c_,d_]:=Block[{}, Return[d /. a\[Rule] b];]/;(b\[Equal]c);
sum[a_,b_,c_,d_]:=(1+c-b)*d /; FreeQ[d,a];

sum[a_,1,b_,c__]:=
  sum[a,1,b,(c /. ThetaStep[a,b]->1)] /; (FreeQ[c,ThetaStep[a,b]]\[Equal]
        False)

LorentzProduct[a_,1]:=a;
LorentzProduct[1,a_]:=a;
LorentzProduct[a_,LorentzProduct[b_,c_]]:=LorentzProduct[a,b,c];

Unprotect[Plus];
sum[b_,1,g_,conj[M1_[x_,b_+c_]] M2_[y_,b_+c_]] + 
      sum[a_,1,c_,conj[M1_[x_,a_]] M2_[y_,a_]]:= 
    sum[a,1,c+g,conj[M1[x,a]] M2[y,a]];
Protect[Plus];

sum[a_,b_,c_,0]:=0;

sum[a_,b_,c_,d_ e_]:=d sum[a,b,c,e] /; (FreeQ[d,a]  && FreeQ[d,StillCalcSum])

sum[a_,b_,c_, conj[M_[a_,x_]] M_[a_,y_]+conj[M_[a_+c_,x_]] M_[a_+c_,y_]]:=
    sum[a,b,2*c,conj[M[a,x]] M[a,y]];
sum[a_,b_,c_, conj[M_[a_,x_]] M_[a_,y_]]:=
    Delta[x,y] /; getDim[M]\[Equal]c && b\[Equal]1;
sum[a_,b_,c_, conj[M_[x_,a_]] M_[y_,a_]]:=
    Delta[x,y] /; getDim[M]\[Equal]c && b\[Equal]1;
UseCheckMatrixProduct=True;

sum[a_,b_,c_,d_]:=Block[{res,j},
        deltas=Cases[d,x:(Delta[a,y_]),10];
        res=d*ThetaStep[a,c];
        For[j=1,j\[LessEqual]Length[deltas],
          If[deltas[[j,2]]===a,
            res =res /. deltas[[j,2]]\[Rule]deltas[[j,1]];,
            res =res /. deltas[[j,1]]\[Rule]deltas[[j,2]];
            ];
          j++;];
        Return[res];
        ] /; (FreeQ[d,Delta[a,_]]\[Equal]False && 
          FreeQ[d,StillCalcSum]\[Equal]True);

ThetaStep[a_Integer,b_Integer]:=If[a\[LessEqual]b,Return[1];,Return[0];];

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



(*------------------------------------- *)
(* 
  Group Factors *)
(*------------------------------------- *)

(*------- SU2 ---------*)

Sigma={{{0,1},{1,0}},{{0,-\[ImaginaryI]},{\[ImaginaryI],0}},{{1,0},{0,-1}}};

Sig[a_Integer,b_Integer,c_Integer]:=Sigma[[a,b,c]];

conj[Sig[a_,2,1]]:=Sig[a,1,2];
conj[Sig[a_,1,2]]:=Sig[a,2,1];
conj[Sig[a_,b_,b_]]:=Sig[a,b,b];

SigmaProd[gen4_Integer,gen3_Integer][a_Integer,b_Integer] := 
    Sig[gen4,a,b]*Sig[gen3,a,b]; 


(*--------SU3----------*)

Lambda={{{0,1,0},{1,0,0},{0,0,0}},{{0,-\[ImaginaryI],0},{\[ImaginaryI],0,
          0},{0,0,0}},{{1,0,0},{0,-1,0},{0,0,0}},{{0,0,1},{0,0,0},{1,0,
          0}},{{0,0,-\[ImaginaryI]},{0,0,0},{\[ImaginaryI],0,0}},{{0,0,0},{0,
          0,1},{0,1,0}},{{0,0,0},{0,0,-\[ImaginaryI]},{0,\[ImaginaryI],0}},
      1/Sqrt[3] {{1,0,0},{0,1,0},{0,0,-2}}};

Lam[a_Integer,b_Integer,c_Integer] :=Lambda[[a,b,c]];

SetAttributes[LambdaProd,Orderless];
SetAttributes[SigmaProd,Orderless];

conj[Lam[a_,ct2,ct1]]:=Lam[a,ct1,ct2];
conj[Lam[a_,ct3,ct1]]:=Lam[a,ct1,ct3];
conj[Lam[a_,ct3,ct2]]:=Lam[a,ct2,ct3];


conj[Lam[a_,b_,c_]]:=Lam[a,c,b];

fSU3[a_Integer,b_Integer,c_Integer]:=Levi[[a,b,c]];
fSU2[a_Integer,b_Integer,c_Integer]:=Signature[{a,b,c}];
fSU2[a_,b_,b_]:=0;
fSU2[a_,a_,b_]:=0;
fSU2[a_,b_,a_]:=0;
sum[a_,1,3,d_]:=Sum[d,{a,1,3}] /; (FreeQ[d,fSU2[a,x_,y_]]\[Equal]False);

(*---------------------------------*)
(* Matrices *)
\
(*---------------------------------*)

E2={{1,0},{0,1}};
E6=IdentityMatrix[6];
E3=IdentityMatrix[3];

eps2={{0,1},{-1,0}};

epsTensor[a___,b_,c_,d___]:=-epsTensor[a,c,b,d] /; 
    OrderedQ[{b,c}]\[Equal]False
epsTensor[a__Integer]:=1 /; OrderedQ[{a}] && Intersection[{a}]==={a};
epsTensor[a__]:=0 /; Intersection[{a}]=!={a};

CalcDelta[expr_]:=Block[{i,j},
      If[Head[expr]\[Equal]List,erg=List@@expr;erg=CalcDelta/@erg;
        Return[List@@erg];];
      If[Head[expr]\[Equal]Plus, erg=List@@expr;erg=CalcDelta/@erg;
        Return[Plus@@erg];];
      expand=Expand[expr];
      If[Head[expand]==Plus,
        erg=List@@expand;
        erg=CalcDelta/@erg;
        Return[Plus@@erg];
        ];
      
      If[FreeQ[expr,Delta]\[Equal]False,
        deltas=Cases[Cases[expand,x:(Delta[a_,b_]),3],x_?IntF];
         If[Length[deltas]>0,
          
          expand =expand /. 
                Flatten[
                  Table[{deltas[[j,2]]\[Rule]deltas[[j,1]]},{j,1,
                      Length[deltas]}]];
          ]; 
        ];
      
       If[FreeQ[expr,Delta]\[Equal]False,
        deltas=Cases[expand,x:(Delta[a_,b_]),3];
         For[i=1,i\[LessEqual]Length[deltas],
          If[FreeQ[expand,sum[deltas[[i,1]],aaa_,bbb_]]\[Equal]False,
            expand =expand /. {deltas[[i,1]]\[Rule]deltas[[i,2]]};
             ];
          i++;];
        ]; 
      
      If[UseCheckMatrixProduct\[Equal]True,
        Return[CheckMatrixProduct[expand]];,
        Return[expand];
        ];
      
      ];

DeltaIntQ[x_]:=
    If[Head[x]===Delta,If[IntegerQ[x[[1]]],Return[True];,Return[False]];,
      Return[False]];
IntF[x_]:=IntegerQ[x[[1]]];



CheckMatrixProduct[term_]:=Block[{i,expand,op1,op2,summe, iterator},
      expand=term;
      op1={};op2={};summe={};iterator={};
      If[FreeQ[expand,sum[b_,1,d_]*A_[x_,b_] conj[B_[z_,b_]]]\[Equal]True,
        Return[term];,
        
        needed=term;
        While[
          FreeQ[needed,sum[b_,1,d_]*A_[x_,b_] conj[B_[z_,b_]]]\[Equal]False,
          
          needed=needed /. {sum[b_,1,d_]*A_[x_,b_] conj[B_[z_,b_]] \[Rule] 
                  Op1[A]*Op2[B]*Fin[d]*Iter[b]};
          
          op1= Join[op1,{Cases[needed,Op1[_]][[1,1]]}];
          op2= Join[op2,{Cases[needed,Op2[_]][[1,1]]}];
          summe=Join[summe,{Cases[needed,Fin[_]][[1,1]]}];
          iterator=Join[iterator,{Cases[needed,Iter[_]][[1,1]]}];
          
          
          needed = 
            needed /. {Op1[_]\[Rule]1,Op2[_]\[Rule]1,Fin[_]\[Rule]1,
                Iter[_]\[Rule]1};
          ];
        
        For[i=1,i\[LessEqual]Length[op1],
          prod=Cases[ListMatrixProdukt,{op1[[i]],op2[[i]],_,_}];
          If[prod=!={},
            If[prod[[1,3]]\[Equal]summe[[i]],
                If[Head[prod[[1,4]]]===conj,
                    
                    expand=expand /. 
                            op1[[i]][x_,b_] conj[op2[[i]][z_,b_]] \[Rule] 
                              prod[[1,4]][x,z]/. 
                          sum[iterator[[i]],1,_] \[Rule]1;,
                    
                    expand=expand /. 
                            op1[[i]][x_,b_] conj[op2[[i]][z_,b_]] \[Rule] 
                              prod[[1,4]][z,x]/. 
                          sum[iterator[[i]],1,_] \[Rule]1;
                    ];
                ];
            ];
          i++;];
        Return[expand];];
      ]; 

CheckMatrixProduct[x_Plus]=CheckMatrixProduct/@x;

CheckMatrixProduct2[x_]:=Block[{temp,res,i},
      temp=x;
      While[FreeQ[temp,sum[a_,b_,c_,d_]]\[Equal]False,
        temp = temp /. sum[a_,b_,c_,d_]\[Rule]d sum[a,b,c];
        ];
      temp=Expand[temp];
      res=0;
      If[Head[temp]===Plus,
        For[i=1,i\[LessEqual]Length[temp],
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
            
            Return[(Description /. 
                    Extract[ParameterDefinitions,pos[[1,1]]][[2]])];
            ];
        ];
      ];

MassMatrix[y_]:=ShowMassMatrix[y,True];
MassMatrixUnexpanded[y_]:=ShowMassMatrix[y,False];

ShowMassMatrix[y_,Full_]:=Block[{pos,field,i,states},
      If[FreeQ[Transpose[dirac][[1]],y]\[Equal]False,
        field =  (y /. diracSub)[[1]];,
        field = y;
        ];
      (* For[i=1,i\[LessEqual]Length[NameOfStates],
            If[Head[DEFINITION[NameOfStates[[i]]][MatterSector]]===List,
              
              If[FreeQ[
                      Transpose[
                          DEFINITION[NameOfStates[[i]]][MatterSector]][[2]],
                      field]\[Equal]False,
                  
                  pos = Position[DEFINITION[NameOfStates[[i]]][MatterSector],
                      field];
                  states = NameOfStates[[i]];
                  ];
              ];
            i++;]; *)
      
      For[i=1,i\[LessEqual]Length[NameOfStates],
        If[Head[MixES[NameOfStates[[i]]]]===List,
          If[FreeQ[MixedNames[NameOfStates[[i]]],field]\[Equal]False,
              pos = Position[MixedNames[NameOfStates[[i]]],field];
              states = NameOfStates[[i]];
              ];
          ];
        i++;];
      
      
      If[Head[pos]===List,
        If[Full\[Equal]True,
            Return[MassMatricesFull[states][[pos[[1,1]]]]];,
            Return[MassMatrices[states][[pos[[1,1]]]]];
            ];,
        Print["Mass matrix for ",y," does not exist!"];
        ];
      ];


SelfEnergySum[y_]:=ShowSelfEnergy[y,True];
SelfEnergyList[y_]:=ShowSelfEnergy[y,Flase];

ShowSelfEnergy[y_,sum_]:=Block[{pos,field,i,states},
      field = y;
      For[i=1,i\[LessEqual]Length[NameOfStates],
        If[
          FreeQ[ParticlesSelfEnergy1LoopSum[NameOfStates[[i]]],
              field]\[Equal]False,
          
          pos = Position[ParticlesSelfEnergy1LoopSum[NameOfStates[[i]]],
              field];
          states = NameOfStates[[i]];
          ];
        i++;];
      
      If[Head[pos]===List,
        If[sum\[Equal]True,
          Return[SelfEnergy1LoopSum[states][[pos[[1,1]]]]];,
          Return[SelfEnergy1LoopList[states][[pos[[1,1]]]]];
          ];
        Print["Self energy for ",y," does not exist!"];
        ];
      ];

TadpoleEquation[y_]:=Block[{pos,field,i,states},
      If[FreeQ[Transpose[dirac][[1]],y]\[Equal]False,
        field =  (y /. diracSub)[[1]];,
        field = y;
        ];
      For[i=1,i\[LessEqual]Length[NameOfStates],
        If[Head[DEFINITION[NameOfStates[[i]]][VEVs]]===List,
          If[FreeQ[DEFINITION[NameOfStates[[i]]][VEVs],field]\[Equal]False,
              pos = Position[DEFINITION[NameOfStates[[i]]][VEVs],field];
              states = NameOfStates[[i]];
              ];
          ];
        i++;];
      
      If[Head[pos]===List,
        Return[TadpoleEquations[states][[pos[[1,1]]]]\[Equal]0];,
        Print["Tadpole equation for ",y," does not exist!"];
        ];
      ];


Tadpole1LoopSum[y_]=ShowTadpole1Loop[y,True];
Tadpole1LoopList[y_]=ShowTadpole1Loop[y,False];

ShowTadpole1Loop[y_,sum_]:=Block[{pos,field,i,states},
      If[FreeQ[Transpose[dirac][[1]],y]\[Equal]False,
        field =  (y /. diracSub)[[1]];,
        field = y;
        ];
      For[i=1,i\[LessEqual]Length[NameOfStates],
        If[Head[DEFINITION[NameOfStates[[i]]][VEVs]]===List,
          If[FreeQ[DEFINITION[NameOfStates[[i]]][VEVs],field]\[Equal]False,
              pos = Position[DEFINITION[NameOfStates[[i]]][VEVs],field];
              states = NameOfStates[[i]];
              ];
          ];
        i++;];
      
      If[Head[pos]===List,
        If[sum\[Equal]True,
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
      
      For[i=1,i\[LessEqual]Length[sums],
        (* subIndices=Join[subIndices,{sums[[i,1]] \[Rule] jnf[i]}]; *)
      
          summand=Append[sums[[i]],summand] /. {sums[[i,1]] \[Rule] jnf[i]} ;
        i++;];
      Return[summand /. StillCalcSum\[Rule]1 ];
      
      ];

sumQ[x_]:=If[Head[x]===sum,Return[True];,Return[False];];
inf[x_]:=ToExpression["i"<>ToString[x]];
jnf[x_]:=ToExpression["j"<>ToString[x]];



(* -------------------------------------------- *)
(* 
  Structure Constant *)
(* -------------------------------------------- *)

Levi=Table[0,{8},{8},{8}];
Levi[[1,2,3]]=1; Levi[[3,1,2]]=1; Levi[[2,3,1]]=1; Levi[[3,2,1]]=-1; 
Levi[[2,1,3]]=-1;Levi[[1,3,2]]=-1;

Levi[[1,4,7]]=1/2; Levi[[7,1,4]]=1/2; Levi[[4,7,1]]=1/2; Levi[[1,7,4]]=-1/2; 
Levi[[7,4,1]]=-1/2;Levi[[4,1,7]]=-1/2;
Levi[[2,4,6]]=1/2; Levi[[6,2,4]]=1/2; Levi[[4,6,2]]=1/2; Levi[[2,6,4]]=-1/2; 
Levi[[6,4,2]]=-1/2; Levi[[4,2,6]]=-1/2;
Levi[[2,5,7]]=1/2; Levi[[7,2,5]]=1/2; Levi[[5,7,2]]=1/2; Levi[[2,7,5]]=-1/2; 
Levi[[7,5,2]]=-1/2; Levi[[5,2,7]]=-1/2;
Levi[[3,4,5]]=1/2; Levi[[5,3,4]]=1/2; Levi[[4,5,3]]=1/2; Levi[[3,5,4]]=-1/2; 
Levi[[5,4,3]]=-1/2; Levi[[4,3,5]]=-1/2;

Levi[[1,5,6]]=-1/2; Levi[[6,1,5]]=-1/2; Levi[[5,6,1]]=-1/2;  
Levi[[1,6,5]]=1/2; Levi[[6,5,1]]=1/2; Levi[[5,1,6]]=1/2;
Levi[[3,6,7]]=-1/2; Levi[[7,3,6]]=-1/2; Levi[[6,7,3]]=-1/2; 
Levi[[3,7,6]]=1/2; Levi[[7,6,3]]=1/2; Levi[[6,3,7]]=1/2;

Levi[[4,5,8]]=Sqrt[3]/2; Levi[[8,4,5]]=Sqrt[3]/2; Levi[[5,8,4]]=Sqrt[3]/2; 
Levi[[4,8,5]]=-Sqrt[3]/2; Levi[[8,5,4]]=-Sqrt[3]/2;Levi[[5,4,8]]=-Sqrt[3]/2;
Levi[[6,7,8]]=Sqrt[3]/2; Levi[[8,6,7]]=Sqrt[3]/2; Levi[[7,8,6]]=Sqrt[3]/2; 
Levi[[6,8,7]]=-Sqrt[3]/2; Levi[[8,7,6]]=-Sqrt[3]/2; Levi[[7,6,8]]=-Sqrt[3]/2;

fSU3[a_,b_,c_]:=-fSU3[b,a,c]/;OrderedQ[{a,b}]\[Equal]False
fSU3[a_,b_,c_]:=-fSU3[a,c,b]/;OrderedQ[{b,c}]\[Equal]False
fSU3[a_,b_,c_]:=-fSU3[c,b,a]/;OrderedQ[{a,c}]\[Equal]False

fSU2[a_,b_,c_]:=-fSU2[b,a,c]/;OrderedQ[{a,b}]\[Equal]False
fSU2[a_,b_,c_]:=-fSU2[a,c,b]/;OrderedQ[{b,c}]\[Equal]False
fSU2[a_,b_,c_]:=-fSU2[c,b,a]/;OrderedQ[{a,c}]\[Equal]False

(*
  TA[3,a_,b_,c_]:=Lam[a,b,c]/2;
  TA[2,a_,b_,c_]:=Sig[a,b,c]/2;
  *)

TA[SU[3],a_,b_,c_]:=Lam[a,b,c]/2;
TA[SU[2],a_,b_,c_]:=Sig[a,b,c]/2;

(* Generator[a_,_,1,_,_,_]:=0 /; a>1; *)

Generator[a_,_,1,_,_,_]:=0 /; a[[1]]>1;

fU1[a__]:=0;

FST[U[1]][a__]:=0;
FST[SU[2]][a__]:=fSU2[a];
FST[SU[3]][a__]:=fSU3[a];

MakeMatricesSUN[N_,old_]:=Block[{i,j,n1,n2,generators},
      generators = Table[0,{N^2-1},{N},{N}];
      
      For[i=1,i\[LessEqual]Length[old],
        For[n1=1,n1\[LessEqual]N-1,
          For[n2=1,n2\[LessEqual]N-1,
            generators[[i,n1,n2]]=old[[i,n1,n2]];
            n2++;];
          n1++;];
        i++;];
      
      j=1;
      
      For[i=Length[old]+1,i\[LessEqual]N^2-2,
        generators[[i,j,N]]=1;
        generators[[i,N,j]]=1;
        generators[[i+1,j,N]]=-\[ImaginaryI];
        generators[[i+1,N,j]]=\[ImaginaryI];
        j++;
        i=i+2;];
      
      sum=0;
      For[i=1,i\[LessEqual]N-1,
        generators[[N^2-1,i,i]]=1;
        sum++;
        i++;
        ];
      
      generators[[N^2-1,N,N]]=-sum;
      generators[[N^2-1]]=generators[[N^2-1]]/Sqrt[( sum^2 + N-1)/2];
      
      Return[generators];
      ];


(* ----------------------------------- *)
(* Metrik *)
(* \
----------------------------------- *)

SetAttributes[g,Orderless];
g[1,1]:=-1;g[2,2]:=-1;g[3,3]:=-1;g[4,4]:=-1;
g[a_Integer,b_Integer]:=0 /; (a\[NotEqual] b);

GetNonZeroEntries[term_]:=Block[{sub={},pos,i,fac=1,epsilons, deltas, noSUN},
      If[Head[term]===Times, temp= List@@term;, temp = {term}];
      
      noSUN =Select[temp,(Head[Head[#]]\[Equal]RM)&,5];
      epsilons= Select[temp,(Head[#]\[Equal]epsTensor) &,5];
      deltas=Select[temp,(Head[#]\[Equal]Delta) &,5];
      
      For[i=1,i\[LessEqual]Length[noSUN],
        pos=Position[SA`NonZeroEntries,noSUN[[i,0]]][[1,1]];
        entry=Extract[SA`NonZeroEntries,pos];
        sub=
          Join[sub,
            Flatten[Table[
                noSUN[[i,j]]\[Rule]entry[[2,j]],{j,1,Length[entry[[2]]]}]]];
        fac=fac*(noSUN[[i]]/.sub);
         i++;];
      
      sub = 
        Join[sub,{Flatten[
              Table[Map[(#\[Rule]1)&,List@@deltas[[i]]],{i,1,
                  Length[deltas]}]]}];
      sub = 
        Join[sub,{Flatten[
              Table[Map[(#\[Rule]Position[List@@epsilons[[i]],#][[1,1]])&,
                  List@@epsilons[[i]]],{i,1,Length[epsilons]}]]}];
      
      
      Return[{Flatten[sub],fac}];
      
      ];