WITH Control;
USE Control;

Package Gestion_Fiche is
--Types
      M:integer:=5;
      Type T_Sport is (judo,tennis,natation,football,danse,rugby);
      TYPE T_Tarif IS ARRAY(T_Sport) OF Float;
      Type T_Reduction is array(integer range 0..4) of float;
      Type T_Sportx is array(T_Sport) of Boolean;
      Type T_Fiche is record
          Nom:T_Nom:=(others=>' ');
          Age : integer :=0;
          Sex : boolean :=false;
          Tarif: float:=0.0;
          Sport:T_Sportx:=(others=>false);
          NbrFrr :integer :=0;
          NbrSp :integer:=0;
      END RECORD ;
      type t_girlboy is (girl,boy);
      TYPE T_T_Fiche IS ARRAY(Integer RANGE 1..6*M) OF T_Fiche;
      Type GirlBoy is array(t_girlboy) of integer;
      Subtype AgeRange is integer range 4..12 ;
      TYPE T_Groupe IS ARRAY(T_Sport,AgeRange) OF GirlBoy ;
      --default
      Tarif:T_Tarif:=(12.0,10.0,15.0,10.0,8.0,12.0);
      Reduc:T_Reduction:=(1.0,0.9,0.8,0.6,0.5);

--Procedures/functions

      Function Tarifs(Tarif:T_Tarif; Reduc :T_Reduction ; Tf :T_Fiche) return float ;
      Function nbrsport(Tf:T_Fiche) return integer ;
      procedure saisie_sport(sport:out T_Sport);
End Gestion_Fiche;