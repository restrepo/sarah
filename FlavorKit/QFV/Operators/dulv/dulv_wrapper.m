(* Code automatically generated by 'PreSARAH' *) 
(* Created at 10:52 on 4.4.2014 *) 
 
 
ProcessWrapper = True; 
NameProcess = "dulv" 
ExternalFields = {DownQuark, bar[UpQuark], Neutrino, bar[ChargedLepton]}; 
SumContributionsOperators["dulv"] = { 
{OdulvSLL, TSOdulvSLL + TVOdulvSLL}, 
{OdulvSRR, TSOdulvSRR + TVOdulvSRR}, 
{OdulvSRL, TSOdulvSRL + TVOdulvSRL}, 
{OdulvSLR, TSOdulvSLR + TVOdulvSLR}, 
{OdulvVRR, TSOdulvVRR + TVOdulvVRR}, 
{OdulvVLL, TSOdulvVLL + TVOdulvVLL}, 
{OdulvVRL, TSOdulvVRL + TVOdulvVRL}, 
{OdulvVLR, TSOdulvVLR + TVOdulvVLR}}; 
