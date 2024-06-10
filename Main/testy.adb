WITH Ada.Text_Io, Ada.Integer_Text_Io,ada.Float_Text_IO, control, gestion_fiche,gestion_tableaux_fiche,Gestion_Groupe_Tableaux_Fiche;
USE Ada.Text_Io, Ada.Integer_Text_Io,ada.Float_Text_IO, control, gestion_fiche,gestion_tableaux_fiche,Gestion_Groupe_Tableaux_Fiche;

PROCEDURE Testy IS
   c:integer;
   choix:Integer;
   N:constant string:="liste de fiche";
   Qlf:Boolean;
   Tf:T_T_Fiche;
   f:t_fiche;
   found:boolean:=false;
   Dejavu:Boolean;
   Nom:T_Nom:=(OTHERS=>' ');
   G:T_Groupe;
   Sp:T_Sport;
   age:integer;
   St:T_Sat;
BEGIN
   LOOP
   Put_Line("choisir une option:");
   Put_Line("1-inscrire");
   Put_Line("2-visualisez tous");
   Put_Line("3-supprimez");
   Put_Line("4-desinscrire");
   put_line("5-visualisez qlq");
   put_line("6-visualiser les groupes");
   put_line("7-mise a jour de l'age");
   put_line("8-mise a jour frr");
   put_line("9-sport que personne ne pratique");
   put_line("10-liste d'enfant inscrit en sport a donner");
   put_line("11-age moyen d'enfant pratiquant sport x");
   put_line("12-age moyen d'enfant pratiquant +1 sport");
   Put_Line("13-montant hebdo totale");
   put_line("14-sport populaire");
   put_line("15-nombre d'enfant inscrit en sport a donner");
   put_line("16-nombre d'enfant avec un age a donner");
   Put_Line("17-quitter");
   Get(Choix);Skip_Line;
   CASE Choix IS
        WHEN 1=>
            Restaure(Tf,N);
            Update_Grp(G,Tf);
            test_sat(Tf,st);
            Inscription(f,Tf,Qlf,dejavu,st);
            IF NOT Dejavu THEN
               FOR I IN Tf'RANGE LOOP
                  IF Tf(I).Age=0 THEN
                     Tf(I):=F;
                     exit;
                  END IF;
               END LOOP;
             overwrite_fiche(tf(1),n);
                  FOR I IN 2..Tf'Last LOOP

                    Save_Fiche(Tf(I),N);

                  end loop;

             Reset_Fiche(F);
             ELSE
               overwrite_fiche(tf(1),n);
                  FOR I IN 2..Tf'Last LOOP

                    Save_Fiche(Tf(I),N);

                  end loop;
             end if;
        WHEN 2=>
                  restaure(tf,n);
                  Visualize_Everyone(Tf);
        WHEN 3=>
                  Namecheck(Nom);
            Restaure(Tf,N);
            FOR I IN Tf'RANGE LOOP
                  FOR I IN Tf'RANGE LOOP
                     IF Tf(I).Nom=Nom THEN
                        Reset_Fiche(Tf(I));
                        found:=true;
                        EXIT;
                     END IF;
               END LOOP;
               IF Found THEN
                  overwrite_fiche(tf(1),n);
                  FOR I IN 2..Tf'Last LOOP

                        Save_Fiche(Tf(I),N);

                     end loop;
                  ELSE
                  put_line("non-trouve");
               END IF;
            END LOOP;

         WHEN 4=>

            Put_Line("donnez nom");
            get_line(nom,k);
            saisie_sport(sp);
            restaure(tf,n);
            Desinscription(Tf,Sp,C,Nom);
            IF C=6 THEN
               FOR I IN Tf'RANGE LOOP
                  FOR I IN Tf'RANGE LOOP
                     IF Tf(I).Nom=Nom THEN
                        Reset_Fiche(Tf(I));

                        EXIT;
                     END IF;
                  END LOOP;

                  overwrite_fiche(tf(1),n);
                   FOR I IN 2..Tf'Last LOOP

                        Save_Fiche(Tf(I),N);

                   END LOOP;
                  end loop;
              ELSE
                for i in tf'range loop
                      overwrite_fiche(tf(1),n);
                  FOR I IN 2..Tf'Last LOOP

                        Save_Fiche(Tf(I),N);

                  END LOOP;
                END LOOP;
               end if;
         WHEN 5 =>
                  restaure(tf,n);
                  namecheck(nom);
                  visualize_kidx(tf,nom);
         WHEN 6 =>
            restaure(tf,n);
            Update_Grp(G,Tf);
            Visualize_G(G);
         WHEN 7=>
                restaure(tf,n);
            FOR I IN Tf'RANGE LOOP
               IF Tf(I).Age/=0 THEN
                  Tf(I).Age:=Tf(I).Age+1;
               END IF;
            END LOOP;
            FOR I IN Tf'RANGE LOOP
               IF Tf(I).Age>12 THEN
                  Reset_Fiche(Tf(I));
               END IF;
            END LOOP;
            overwrite_fiche(tf(1),n);
                  FOR I IN 2..Tf'Last LOOP
                    Save_Fiche(Tf(I),N);
                  end loop;

            WHEN 8=>
            restaure(tf,n);
            Put_line("donner le nom");
            Get_Line(Nom,k);
            FOR I IN Tf'Range LOOP
               IF Tf(I).Nom=Nom THEN
                  Tf(I).nbrfrr:=Tf(I).nbrfrr+1;

                  END IF;
            END LOOP;
            overwrite_fiche(tf(1),n);
                  FOR I IN 2..Tf'Last LOOP

                        Save_Fiche(Tf(I),N);

                  END LOOP;
            WHEN 9=>
                restaure(tf,n);
                Update_Grp(G,Tf);
                Visualize_Sport_With_NoOne(G);
            WHEN 10=>
                restaure(tf,n);
                saisie_sport(sp);
                Kidlist_Of_SportX(Tf, sp);
            WHEN 11=>
                Saisie_Sport(Sp);
                restaure(tf,n);
                Update_Grp(G,Tf);
                Put_Line("la moyenne d'age du sport donne:");Put(MeanAge_Of_SportX(G,sp),Exp=>0,Aft=>2);new_line;
            WHEN 12=>
               Restaure(Tf,N);
               Put_Line("la moyenne d'age pour plus d'un sport:");Put(MeanAge_Of_SportPlus(Tf),Exp=>0,Aft=>2);new_line;

            WHEN 13=>
               restaure(tf,n);
               Put_Line("le montant hebdo totale");Put(MontantHebdoTotal(Tf),Exp=>0,Aft=>2);New_Line;
            WHEN 14=>
               restaure(tf,n);
               Update_Grp(G,Tf);
               PopularSport(G);
            WHEN 15=>
               Saisie_Sport(Sp);
               restaure(tf,n);
               Update_Grp(G,Tf);
               Nbr_Kids_SportX(G,Sp);
            WHEN 16=>
               agecheck(age,qlf);
               restaure(tf,n);
               Update_Grp(G,Tf);
               Nbr_Kids_AgeX(G,Age);

   WHEN OTHERS => Put_Line("erreur");new_line;

         END CASE;
      EXCEPTION
         WHEN Data_Error =>Skip_Line;Put_Line("non");
         when others =>Skip_Line;Put_Line("non");
   end;
   END LOOP;
   end testy;

