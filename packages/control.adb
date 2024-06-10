WITH Ada.Text_Io, Ada.Integer_Text_Io;
USE Ada.Text_Io, Ada.Integer_Text_Io;

PACKAGE BODY Control IS
Procedure NameCheck(N: out T_Nom) is
   K:Integer;
   Z1:Boolean;
   Z2:Boolean;
   Z3:Boolean;
   begin
   loop
   Put_line("donnez votre nom et prenom");
   Get_Line(n,K);
   CASE N(1) IS
      WHEN 'A'..'Z'|'a'..'z' => Z1:=false;
      WHEN OTHERS => Z1:=true;
   END CASE;
   CASE N(k) IS
      WHEN 'A'..'Z'|'a'..'z' => Z2:=false;
      WHEN OTHERS => Z2:=True;
   END CASE;
   FOR I IN 2..k-1 LOOP
      CASE N(I) IS
         WHEN 'A'..'Z'|'a'..'z'|' '|'-'|''' => Z3:=False;
         WHEN OTHERS => Z3:=True;
      END CASE;
   END LOOP;
      IF Z1=False and z2=false and z3=false THEN
         EXIT;
      ELSE
         Put_Line("caractére(s) invalide utilisé(s)");
      end if;
   END LOOP;
END Namecheck;
Procedure AgeCheck(Age: out integer;qlf: out boolean)is
   BEGIN
   Put_line("donnez age");
   Get(Age);Skip_Line;
   IF Age>12 THEN
      Put_Line("est trop agé pour être inscrit.");Qlf:=False;
   ELSE IF Age <4 THEN
      Put_Line("est trop jeune pour être inscrit.");Qlf:=False;

   ELSE
      qlf:=true;
      END IF;
      end if;
END Agecheck;
PROCEDURE SexCheck(gender: out boolean) IS
    sex:character;
   BEGIN
   loop
   Put_line("donnez le sexe de l'enfant soit f ou g");
   Get(Sex);Skip_Line;
   CASE Sex IS
      WHEN 'f' => Gender:=False;exit;
      WHEN 'g' => Gender:=true;exit;
         WHEN OTHERS => Put_Line("donnez sexe valide");

         END CASE;
   END LOOP;
END Sexcheck;
PROCEDURE BrotherCheck(NbrFrr: IN OUT Integer) IS
BEGIN
   Put_line("donnez nombre de frere");
   Get(Nbrfrr);Skip_Line;
END Brothercheck;
end control;



