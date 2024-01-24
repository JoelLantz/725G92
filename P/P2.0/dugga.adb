with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Dugga is
   
   --FUNKTION
   function UP1 (F : in Float)
		return Float is
      
   begin
      return Float'Rounding(F*32.7);
   end UP1;
   
   
   --OPERATOR
   function ">=" (Left : in Character ;
		  Right : in Integer)
		 return Boolean is
      
      S : String(1..1);
      F : Float;
      I : Integer;
      
   begin
      S(1) := Left;
      F := Float'Value(S);
      I := Integer(F);
      return I >= Right;
   end ">=";
   
   
   --PROCEDUR
   procedure UP3 (C : out Character ;
		  S : out String ;
		  F : out Float) is
      
      S2 : String(1..1);

   begin
      Put("Mata in ett tecken: ");
      Get(C);
      Put("Mata in en sträng med exakt 3 tecken: ");
      Get(S);
      S2(1) := C;
      F := Float'Value(S2) * Float'Value(S);
      F := Float'Floor(F);          
   end UP3;
   
   F : Float;
   C : Character;
   I : Integer;
   B : Boolean;
   S : String(1..3);
   
begin
   --UPPGIFT 1
   Put("Mata in ett flyttal: ");
   Get(F);
   Put("produkten av ");
   Put(F, Fore => 0, Aft => 1, Exp => 0);
   Put(" och 32.7 blir ");
   Put(UP1(F), Fore => 0, Aft => 1, Exp => 0);
   New_Line(2);
   
   --UPPGIFT 2
   Put("Mata in ett tecken: ");
   Get(C);
   Put("Mata in ett heltal: ");
   Get(I);
   B := (C >= I);
   Put("Det inmatade tecknet är ");
   if not B then
      Put("inte ");
   end if;
   Put("större eller lika med heltalet.");
   New_Line(2);
   
   --UPPGIFT 3
   UP3(C, S, F);
   Put("Du matade in tecknet: " & C & " och strängen: " & S & " och produkten blev ");
   Put(F, Fore => 2, Aft => 5);
end Dugga;
