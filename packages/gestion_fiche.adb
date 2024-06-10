with ada.Characters.Handling,ada.Text_IO;
use ada.Characters.Handling,ada.Text_IO;
Package body Gestion_Fiche is
FUNCTION Tarifs(Tarif:T_Tarif; Reduc :T_Reduction ; Tf :T_Fiche) RETURN Float IS

      s:float:=0.0;
   BEGIN

      FOR A IN Tf.Sport'RANGE LOOP
         IF Tf.Sport(A)=True THEN
            S:=S+Tarif(A);
         END IF;
      END LOOP;
      IF Tf.Nbrfrr<=3 AND Tf.Nbrfrr>=0 THEN
         S:=S*Reduc(Tf.Nbrfrr);
      ELSE
         S:=S*Reduc(4);
      END IF;
      IF Tf.Nbrsp>=3 THEN
         S:=S-5.0;
      END IF;
      RETURN S;
END Tarifs;
FUNCTION Nbrsport(Tf:T_Fiche) RETURN Integer IS
      c:integer:=0;
   BEGIN
      FOR A IN Tf.Sport'RANGE LOOP
         IF Tf.Sport(A)=True THEN
            C:=C+1;
         END IF;
      END LOOP;
      RETURN C;
END Nbrsport;
PROCEDURE Saisie_Sport(sport:out T_Sport) IS
      S:String(1..9);
      k:integer;
   BEGIN
       LOOP
               begin
            Put_Line("donnez sport");
            Get_Line(s,k);
                  Sport:=T_Sport'Value(To_Lower(s(1..k)));
                  EXIT;
               EXCEPTION
                  WHEN Constraint_Error =>Skip_Line;Put_Line("mauvais sport");
                  WHEN OTHERS =>Skip_Line;Put_Line("try again");
               END;
               end loop;
end saisie_sport;
end gestion_fiche;


