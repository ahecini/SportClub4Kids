WITH Ada.Text_Io, Ada.Integer_Text_Io,ada.Characters.Handling,ada.Float_Text_IO;
USE Ada.Text_Io, Ada.Integer_Text_Io,ada.Characters.Handling,ada.Float_Text_IO;



PACKAGE BODY Gestion_Tableaux_Fiche IS

----SAVING/RESTAURATION**********

PROCEDURE restaure(tf: out t_t_fiche;savename:string) IS
      Mon_Fichier:Fiche_Fiche.File_Type;
      ix:integer:=1;
   BEGIN
      begin
       Open(mon_fichier,In_File,Name=>savename);

      EXCEPTION
         WHEN OTHERS=>Create(Mon_Fichier,Name=>savename);
      END;
      WHILE NOT End_Of_File(mon_fichier) LOOP
      Read(mon_fichier,Tf(Ix));
      Ix:=Ix+1;
     exit when ix=30;
     END LOOP;
         Close(Mon_Fichier);
end restaure;

PROCEDURE save_fiche(f: IN T_Fiche;savename:string) IS
           mon_fichier:fiche_fiche.file_type;
   BEGIN
       begin
       Open(mon_fichier,append_File,Name=>savename);
       EXCEPTION
          WHEN OTHERS => Create(Mon_Fichier,Name=>savename);
       END;
       Write(mon_fichier,f);
       Close(mon_fichier);
END Save_Fiche;

PROCEDURE overwrite_fiche(f: IN T_Fiche;savename:string) IS
           mon_fichier:fiche_fiche.file_type;
   BEGIN

       begin
       Open(mon_fichier,out_File,Name=>savename);
       EXCEPTION
          WHEN OTHERS => Create(Mon_Fichier,Name=>savename);
       END;

                 Write(mon_fichier,f);

      Close(mon_fichier);
END Overwrite_fiche;

    ----PROCEDURES**********
PROCEDURE Reset_Fiche(F: IN OUT T_Fiche) IS
     empty:constant T_nom:=(others=>' ');

    BEGIN

         f.nom:=empty;
         f.Age:=0;
          f.Sex:=false;
          f.Tarif:=0.0;
         FOR J IN f.Sport'RANGE LOOP
            f.Sport(J):=False;
            end loop;
          f.NbrFrr:=0;
         f.NbrSp:=0;

end reset_fiche;


PROCEDURE Insport(f: IN OUT T_Fiche;sp: in out t_sport;st: in t_sat) IS
   N:Max6;
   BEGIN
       LOOP
        begin
        Put_line("donnez le nombre de sport auquel il/elle veut s'inscrire");
        Get(N);Skip_Line;
        EXIT;
        EXCEPTION
           WHEN Constraint_Error => skip_line;Put_Line("on a que 6 sport");
           WHEN others => skip_line;Put_Line("tapez un nombre");
   END;
   END LOOP;
     FOR I IN 1..N LOOP
        loop
           begin
    Put("donnez le sport n#:");put(i, width=>1);
    New_Line;
    Get_Line(S,K);
    Sp:=T_sport'Value(to_lower(S(1..K)));
    if st(sp)<5 then
                    F.Sport(Sp):=True;
    ELSE
                 Put_Line("sport sature");
    end if;
          exit;
           EXCEPTION
              WHEN Constraint_Error => Put_Line("mauvais sport");
           END;
        END LOOP;
        end loop;
end insport;

Procedure Visualize_kidx(Tf: in T_T_Fiche;nom: in t_nom) is
       found:boolean:=false;
   BEGIN
   FOR I IN Tf'RANGE LOOP
         IF Tf(I).Nom=Nom THEN
            FOR j IN 1..25 LOOP
              Put("*");
            END LOOP;
            new_line;
            Put("nom: ");Put_Line(Tf(I).Nom);
            Put("sex: ");
            IF Tf(I).Sex THEN
               Put("garçon");New_Line;
            ELSE
            Put("fille");New_Line;
            END IF;

            put("age: ");Put(Tf(i).Age, width=>1);new_line;
            put("tarif hebdo: ");Put(Tf(i).Tarif, Aft=>2, Exp=>0);New_Line;
            put("les sports pratiques :");new_line;
            FOR j IN Tf(i).Sport'RANGE LOOP
            IF Tf(i).Sport(j) THEN
             Put(T_Sport'Image(j));New_Line;
            END IF;
            END LOOP;
            put("le nombre de freres: ");Put(Tf(i).Nbrfrr, width=>1);new_line;
            put("le nombre de sports: ");put(Tf(i).nbrsp, width=>1);new_line;
            Found:=True;
            FOR j IN 1..25 LOOP
              Put("*");
            END LOOP;
            new_line;
            exit;
         end if;
   END LOOP;
   IF NOT Found THEN
      put_line("fiche inexistante");
   end if;
end visualize_kidx;

PROCEDURE Inscription(f: IN OUT T_Fiche;tf: in out T_T_Fiche;qlf: out boolean;dejavu: out boolean; st: in t_sat ) IS

          empty:constant T_nom:=(others=>' ');
   Namex:T_Nom:=(OTHERS=>' ');
   rep:character;
        BEGIN
           Dejavu:=false;
           NameCheck(namex);
      f.nom:=namex;
      Agecheck(f.age,Qlf);
   IF Qlf THEN
      Sexcheck(f.sex);
      BrotherCheck(f.NbrFrr);
      Insport(F,Sp,St);
      f.Nbrsp:=Nbrsport(f);
              F.Tarif:=Tarifs(Tarif, Reduc, F);

           ELSE
              f.Nom:=Empty;
              f.age:=0;
              END IF;
           FOR I IN Tf'RANGE LOOP
              IF Tf(I).Nom=namex and tf(i).age=f.age and tf(i).nbrfrr=f.nbrfrr and tf(i).sex=f.sex THEN
                 Dejavu:=True;
                 Put(Namex);New_Line;
                 Put_Line("voila ca fiche:");

                 Visualize_Kidx(Tf,Tf(I).Nom);
                 Put_Line("c'est votre enfant ? tapez o si oui.");
                 Get(Rep);Skip_Line;
                 IF Rep='o' THEN
                    FOR J IN TF(I).Sport'RANGE LOOP
                       if not tf(i).sport(j) then
                          Tf(I).Sport(J):=F.Sport(J);
                          end if;
                    END LOOP;
                    tf(i).nbrsp:=Nbrsport(tf(i));
                    tf(i).Tarif:=Tarifs(Tarif, Reduc, tf(i));

                 END IF;
              END IF;
           END LOOP;
           IF F.Nbrsp=0 THEN
                 f.Nom:=Empty;
              F.Age:=0;
              F.Nbrfrr:=0;
              F.Sex:=False;
           END IF;

END Inscription;
Procedure Visualize_everyone(Tf: in out T_T_Fiche) is

   BEGIN
      FOR I IN Tf'RANGE LOOP
         if tf(i).age/=0 then
      FOR j IN 1..25 LOOP
         Put("*");
      END LOOP;
      New_Line;
            Put("nom: ");Put_Line(Tf(I).Nom);
            Put("sex: ");
            IF Tf(I).Sex THEN
               Put("garçon");New_Line;
            ELSE
               Put("fille");New_Line;
            END IF;

      put("age: ");Put(Tf(i).Age, width=>1);new_line;
      put("tarif hebdo: ");Put(Tf(i).Tarif, Aft=>2, Exp=>0);New_Line;
      put("les sports pratiques :");new_line;
      FOR j IN Tf(i).Sport'RANGE LOOP
       IF Tf(i).Sport(j) THEN
         Put(T_Sport'Image(j));New_Line;
       END IF;
      END LOOP;
      put("le nombre de freres: ");Put(Tf(i).Nbrfrr, width=>1);new_line;
      put("le nombre de sports: ");put(Tf(i).nbrsp, width=>1);new_line;
   FOR j IN 1..25 LOOP
         Put("*");
      END LOOP;
            New_Line;
            end if;
   END LOOP;


end visualize_everyone;

PROCEDURE Desinscription(Tf: IN OUT T_T_Fiche;Sport: IN T_Sport;c: out integer;name: in t_nom)IS
   I2:Integer:=-1;
   BEGIN
   c:=0;
   FOR I IN Tf'RANGE LOOP
      IF Tf(I).Nom=name THEN
         I2:=I;
      END IF;
      end loop;
   IF I2=-1 THEN
      Put_Line("personne non trouvees");
   ELSE
      Tf(I2).Sport(Sport):=False;
      Tf(I2).Nbrsp:=Tf(I2).Nbrsp-1;
      Tf(I2).Tarif:=Tarifs(Tarif, Reduc, Tf(I2));
      IF Tf(I2).Nbrsp=0 THEN
         C:=6;
      END IF;
      end if;
end desinscription;
FUNCTION MontantHebdoTotal(Tf:T_T_Fiche) RETURN Float IS
  s:float:=0.0;
   BEGIN
   FOR I IN Tf'RANGE LOOP
      S:=S+Tf(I).Tarif;
   END LOOP;
   return s;
END MontantHebdoTotal;
PROCEDURE Kidlist_Of_SportX(Tf: IN T_T_Fiche; Sport: IN T_Sport) IS

  BEGIN
     FOR i IN Tf'RANGE LOOP
        IF Tf(I).Sport(Sport) THEN
           Put(Tf(I).Nom);put(',');put(tf(i).age);New_Line;
        END IF;
     END LOOP;
end Kidlist_Of_SportX;

FUNCTION MeanAge_Of_SportPlus(Tf:T_T_Fiche) RETURN Float IS
   s:integer:=0;
   C:Integer:=0;
   m:float:=0.0;
   BEGIN
   FOR I IN Tf'RANGE LOOP
      IF Tf(I).Nbrsp>1 THEN
         S:=S+Tf(I).Age;
         C:=C+1;
      END IF;
   END LOOP;
   if c/=0 then
      M:=Float(S)/Float(C);
   END IF;
   RETURN M;
END MeanAge_Of_SportPlus;
PROCEDURE Test_Sat(Tf: IN  T_t_Fiche;St: IN OUT T_Sat) IS

   BEGIN
      St:=(OTHERS=>0);
      FOR I IN Tf'RANGE LOOP
         FOR J IN T_Sat'range LOOP
            IF Tf(I).Sport(J) THEN
               St(J):=St(J)+1;
            END IF;
         END LOOP;
      END LOOP;
END Test_Sat;

END Gestion_Tableaux_Fiche;