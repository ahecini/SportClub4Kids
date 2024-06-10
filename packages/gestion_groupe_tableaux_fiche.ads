WITH gestion_fiche;
USE gestion_fiche;

Package Gestion_Groupe_Tableaux_Fiche is
--Types

--Procedures/functions
 PROCEDURE update_grp(G: IN OUT T_Groupe;Tf: IN T_t_Fiche);
 Procedure Visualize_G(G: in T_Groupe);
 procedure Visualize_Sport_With_NoOne(G: in T_Groupe);
 procedure Nbr_Kids_SportX(G: in T_Groupe;Sport: in T_Sport);
 procedure Nbr_Kids_AgeX(G: in T_Groupe;Age: in Integer);
 Function MeanAge_Of_SportX(G :T_Groupe ; Sport:T_Sport ) return float ;
 PROCEDURE PopularSport(G:T_Groupe);
 function saturation(g:t_groupe;sport:t_sport) return boolean;
End Gestion_Groupe_Tableaux_Fiche ;
