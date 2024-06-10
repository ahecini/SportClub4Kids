WITH Control, Gestion_Fiche,sequential_io;
USE Control, Gestion_Fiche;

PACKAGE Gestion_Tableaux_Fiche IS

   PACKAGE Fiche_Fiche IS NEW Sequential_Io(T_Fiche);
   use fiche_fiche;
--Types
   sat:boolean;
   S:String(1..50);
   savename:string(1..3):="sxx";
   K:Integer;
   Sp:T_Sport;
   type t_sat is array (t_sport) of integer;
--Procedures/functions
   procedure Inscription(f: IN OUT T_Fiche;tf: in out T_T_Fiche;qlf: out boolean;dejavu: out boolean;  st: in t_sat ) ;
   procedure insport(f: in out T_fiche;sp: in out t_sport;st: in t_sat);
   PROCEDURE restaure(tf: out t_t_fiche;savename:string);
   PROCEDURE Visualize_Everyone(Tf: IN OUT T_T_Fiche);
   PROCEDURE Save_Fiche(F: IN T_Fiche;Savename:String);
   PROCEDURE Visualize_Kidx(Tf: IN T_T_Fiche;Nom: IN T_Nom);
   PROCEDURE Overwrite_Fiche(f: IN T_Fiche;Savename:String);
   PROCEDURE Reset_Fiche(F: IN OUT T_Fiche);
   PROCEDURE Desinscription(Tf: IN OUT T_T_Fiche;Sport: IN T_Sport;C: OUT Integer;Name: IN T_Nom);
   FUNCTION MontantHebdoTotal(Tf:T_T_Fiche) RETURN Float ;
   PROCEDURE Kidlist_Of_SportX(Tf: IN T_T_Fiche; Sport: IN T_Sport);
   FUNCTION MeanAge_Of_SportPlus(Tf:T_T_Fiche) RETURN Float;
   procedure test_sat(Tf: IN  T_t_Fiche;st: in out t_sat);
End Gestion_Tableaux_Fiche;
