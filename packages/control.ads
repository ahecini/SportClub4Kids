Package control is
--Types
   SUBTYPE T_Nom IS String(1..50);
   subtype max6 is integer range 1..6;
--Procedures/functions
      Procedure NameCheck(N: out T_Nom);
      Procedure AgeCheck(Age: out integer;qlf: out boolean);
      Procedure BrotherCheck(NbrFrr: in out integer);
      PROCEDURE SexCheck(gender: out boolean) ;
End control;