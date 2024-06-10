WITH ada.Text_IO,ada.Integer_Text_IO;
USE ada.Text_IO,ada.Integer_Text_IO;

Package body Gestion_Groupe_Tableaux_Fiche is
PROCEDURE Visualize_G(G: IN T_Groupe) IS

   BEGIN
      FOR I IN t_sport LOOP
         FOR J IN Agerange LOOP
            IF G(I,J)(Girl)/=0 OR G(I,J)(Boy)/=0 THEN
               FOR X IN 1..10 LOOP
                  Put('*');
               END LOOP;
               Put("sport:");Put(T_Sport'Image(I));New_Line;
               Put("age:");Put(J,width=>1);New_Line;
               put("nombre de fille:");Put(G(I,J)(Girl),width=>1);New_Line;
               put("nombre de garcon:");Put(G(I,J)(Boy),width=>1);New_Line;
               FOR X IN 1..10 LOOP
                  Put('*');
               END LOOP;
               new_line;
            END IF;
         END LOOP;
      END LOOP;
end Visualize_G ;
PROCEDURE update_Grp(G: IN OUT T_Groupe;Tf: IN T_t_Fiche) IS
      L:T_Girlboy;
      j:integer:=0;
   BEGIN
      g:=(others=>(others=>(0,0)));
      FOR x IN tf'RANGE LOOP
         IF tf(X).Sex THEN
            L:=boy;
         ELSE
            L:=girl;
         end if;
         j:=tf(X).Age;
         FOR Y IN tf(X).Sport'RANGE LOOP
            IF tf(X).Sport(Y) THEN
              G(y,J)(L):= G(y,J)(L)+1;
            end if;
         END LOOP;
         end loop;
END update_grp;

Procedure Visualize_Sport_With_NoOne(G: in T_Groupe) IS
      c:integer:=0;
      BEGIN
      put_line("les sports que personne ne pratiquent:");
      FOR I IN t_sport LOOP
         FOR J IN agerange LOOP
            IF G(I,J)(Girl)=0 AND G(I,J)(Boy)=0 THEN
               C:=C+1;
            END IF;
         END LOOP;
         IF C=9 THEN
            Put(T_Sport'Image(I));New_Line;
         END IF;
         c:=0;
      END LOOP;

END  Visualize_Sport_With_NoOne;
procedure Nbr_Kids_SportX(G: in T_Groupe;Sport: in T_Sport) IS
   K:Integer:=0;
   Boys:Integer:=0;
   girls:integer:=0;
      BEGIN
      FOR J IN agerange LOOP
            K:=K+G(Sport,J)(Girl)+G(Sport,J)(Boy);
            boys:=boys+G(Sport,J)(Boy);
            girls:=girls+G(Sport,J)(Girl);
      END LOOP;
      put("le sport saisie comporte : ");put(k,width=>1);put(" enfants dont on denombre ");put(boys,width=>1);put(" garcon(s) et ");put(girls,width=>1);put(" fille(s).");new_line;
END Nbr_Kids_SportX;

procedure Nbr_Kids_AgeX(G: in T_Groupe;Age: in Integer) is
   K:Integer:=0;
   Boys:Integer:=0;
   girls:integer:=0;
      BEGIN
      FOR i IN t_sport LOOP
            K:=K+G(I,Age)(Girl)+G(I,Age)(Boy);
            boys:=boys+G(I,Age)(Boy);
            girls:=girls+g(i,age)(girl);
      END LOOP;
      put("l'age saisie comporte : ");put(k,width=>1);put(" enfants dont on denombre ");put(boys,width=>1);put(" garcon(s) et ");put(girls,width=>1);put(" fille(s).");new_line;
END Nbr_Kids_AgeX;

FUNCTION MeanAge_Of_SportX(G :T_Groupe ; Sport:T_Sport ) RETURN Float IS
      S:Integer:=0;
      St:Integer:=0;
      m:float:=0.0;
      BEGIN
      FOR J IN agerange LOOP
         S:=S+(G(Sport,J)(Girl)+G(Sport,J)(Boy))*J;
         St:=St+G(Sport,J)(Girl)+G(Sport,J)(Boy);
      END LOOP;
      IF St/=0 THEN
         M:=float(S)/float(St);
      END IF;
      RETURN(M);
END MeanAge_Of_SportX;
PROCEDURE PopularSport(G:T_Groupe) IS
   S:Integer:=0;
      --winner:t_sport;
     max:integer:=0;
    BEGIN
   Put_Line("le(s) sport(s) le(s) plus populaire(s) :");
      FOR I IN t_sport LOOP
         FOR J IN agerange LOOP
            s:=S+G(i,J)(Girl)+G(i,J)(Boy);
          END LOOP;
         IF S>Max THEN
            Max:=S;
         END IF;
            s:=0;
      END LOOP;
      FOR I IN t_sport LOOP
         FOR J IN agerange LOOP
            s:=S+G(i,J)(Girl)+G(i,J)(Boy);
         END LOOP;
         if s=max then
            Put(T_Sport'Image(i));New_Line;
         END IF;
         s:=0;
      END LOOP;

end popularsport;
FUNCTION Saturation(G:T_Groupe;Sport:T_Sport) RETURN Boolean IS
    s:integer:=0;
   BEGIN
   FOR J IN agerange LOOP
      S:=S+G(Sport,J)(Girl)+G(Sport,J)(Boy);
   END LOOP;
   IF S=5 THEN
      RETURN True;
   ELSE
      RETURN False;
   END IF;
end saturation;
end gestion_groupe_tableaux_fiche;
