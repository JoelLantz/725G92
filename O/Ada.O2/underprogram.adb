-- joela064: Samarbetat med isahe131, Isaac Hedman, samma program 

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;


procedure Underprogram is
   
   function "-"(Left : in Integer ;
		Right : in Float) return Float is
      
   begin      
      return Float(Left) - Right;
   end "-";
   
   procedure Sf(S : in out String;
		B : out Boolean) is   
      
   begin     
      if S(S'Last) = 's' or S(S'Last) = 'S' then
	 B := True;
      else
	 B := False;
	 S(S'Last) := 's';
      end if;
   end Sf;
   
   function Fnk(C : in Character)
	       return Boolean is
      
   begin
      return C = 'S' or C = 's';
   end Fnk;
   
   I : Integer;
   F : Float;
   S : String(1..5);
   B : Boolean;
   C : Character;
begin
   
   Put("Mata in ett heltal och ett flyttal: ");
   Get(I);
   Get(F);
   Skip_Line;
   Put("Differensen mellan dem är ");
   Put(I-F, Fore => 0, Aft => 2, Exp => 0);
   New_Line(2);
   
   Put("Skriv in ett 5 tecken långt engelskt substantiv: ");
   Get(S);
   Skip_Line;
   Sf(S, B);
   Put("Ordet " & S & " var troligtvis");
   if not B then
      Put(" inte");
   end if;    
   Put(" i plural från början");
   New_Line(2);
   
   Put("Mata in ett tecken: ");
   Get(C);
   B := Fnk(C);
   Put("Tecknet var ");
   if not B then
      Put("inte ");
   end if;
   Put("sant");
   Skip_Line;
   
end Underprogram;

