-- joela064: Samarbetat med isahe131, Isaac Hedman, samma program--
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure In_Och_Utmatning is
   
   I : Integer;
   F : Float;
   C : Character;
   S : String(1..5);
   
begin
   --UPPGIFT 1
   Put("Skriv in ett heltal: ");
   Get(I);
   Put("Du skrev in talet: ");
   Put(I, Width => 0);
   New_Line(2);
   
   --UPPGIFT 2
   Put("Skriv in fem heltal: ");
   Skip_Line;
   Get(I);
   Put("Du skrev in talen: ");
   Put(I, Width => 0);
   Put(" ");
   Get(I);
   Put(I, Width => 0);
   Put(" ");
   Get(I);
   Put(I, Width => 0);
   Put(" ");
   Get(I);
   Put(I, Width => 0);
   Put(" ");
   Get(I);
   Put(I, Width => 0);
   New_Line(2);
   Skip_Line;
   
   --UPPGIFT 3
   Put("Skriv in ett flyttal: ");
   Get(F);
   Put("Du skrev in flyttalet: ");
   
   Put(F, Fore => 0, Aft => 3, Exp => 0);
   -- Fore => 0
   New_Line(2);
   Skip_Line;
   
   -- UPPGIFT 4
   Put("Skriv in ett heltal och ett flyttal: ");
   Get(I);
   Get(F);
   Put("Du skrev in heltalet:");
   Put(I, Width => 10);
   New_Line;
   Put("Du skrev in flyttalet:");
   Put(F, Fore => 4, Aft => 4, Exp => 0);
   New_Line(2);
   Skip_Line;
   
   --UPPGIFT 5
   Put("Skriv in ett tecken: ");
   Get(C);
   --Vi hade en new line här enligt körexemplet men autorättningen ville inte ha det
   Put("Du skrev in tecknet: ");
   Put(C);
   New_Line(2);
   Skip_Line;
   
   --UPPGIFT 6
   Put("Skriv in en sträng med 5 tecken: ");
   Get(S);
   Put("Du skrev in strängen: ");
   Put(S);
   New_Line(2);
   Skip_Line;
   
   --UPPGIFT 7
   
   Put("Skriv in en sträng med 3 tecken: ");
   Get(S(1..3));
   Put("Du skrev in strängen: ");
   Put(S(1..3));
   New_Line(2);
   Skip_Line;
   
   --UPPGIFT 8
   Put("Skriv in ett heltal och en sträng med 5 tecken: ");
   Get(I);
   Get(C);
   Get(S);
   Put("Du skrev in talet |");
   Put(I, Width => 0);
   Put("| och strängen |");
   Put(S);
   Put("|.");
   New_Line(2);
   Skip_Line;
   
   --UPPGIFT 9
   
   Put("Skriv in en sträng med 3 tecken och ett flyttal: ");
   Get(S(1..3));
   Get(F);
   Put("Du skrev in ");
   Put("""");
   Put(F, Fore => 2, Aft => 3, Exp => 0);
   Put(""" och """);
   Put(S(1..3));
   Put(""".");
   
   New_Line(2);
   --Uppgift 10
   Skip_Line;
   Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line(S(1..5), I);
   Put("Du skrev in strängen: ");
   Put(S(1..I));
   New_Line(2);  
   if I = 5 then
      Skip_Line;     
   end if;
   
   
   --UPPGIFT 11
   Put("Skriv in en sträng som är maximalt 5 tecken: ");
   Get_Line(S(1..5), I);
   Put("Du skrev in strängen: ");
   Put(S(1..I));
   if I = 5 then      
      Skip_Line;
   end if;
   
   
end In_Och_Utmatning;


