-- joela064: Samarbetat med isahe131, Isaac Hedman, samma program

with Ada.Text_IO, Ada.Integer_Text_IO; with Ada.Numerics.Elementary_Functions; with Ada.Float_Text_IO; with Ada.Numerics; 
use Ada.Text_IO, Ada.Integer_Text_IO; use Ada.Numerics.Elementary_Functions; use Ada.Numerics; use Ada.Float_Text_IO;

procedure Calculator is
   procedure Menu_Selection(Selection : out Integer) is 
      
      
   begin
     
      Put_Line("=== HUVUDMENY ===");
      Put_Line("1. Beräkna hypotenusa");
      Put_Line("2. Beräkna triangelvinklar");
      Put_Line("3. Beräkna N-fakultet");
      Put_Line("4. Avsluta programmet");
      
      loop	 
	 Put("Val: ");	 
	 Get(Selection);
	 if Selection > 4 or Selection < 1 then
	    Put_Line("Felaktigt val!");	    
	 else
	    exit;
	 end if;
	 
	 
	 
      end loop;
      
   end Menu_Selection;
   function Calculate_Factorial(N, K : in Integer) return Integer is
      
      I3 : Integer := 1;
      LK : Integer := K;
   begin  
      
      LK := LK - 1;
      for Count in 1..LK loop
	 
	 I3 := I3 * (Count+1);
	 
      end loop;       
      return I3;
   end Calculate_Factorial;
   
   
   procedure Factorial_Program is
      I : Integer;
      I2: Integer;
   begin
      Put("Mata in N: ");
      Get(I2);
      Put(I2, Width => 0);
      I := Calculate_Factorial(I, I2);
      Put("-fakultet = ");
      Put(I, Width => 0);
      
   end Factorial_Program;
   
   
   function Calculate_Hypothenuse(A, B : in Integer) return Float is
      
      C : Float;
      D : Float;
      
   begin
      
      C := Float(A);
      D := Float(B);
      
      return Sqrt(C**2.0 +  D**2.0);
      
   end Calculate_Hypothenuse;
   
   
   procedure Calculate_Angles(Hc, Sa: in Float;
			      Va, Vb, Vc : out Float) is 
      
   begin
      
      Vc := 90.0;
      Va := (Arcsin(Sa/Hc))/Pi * 180.0;
      Vb := 180.0 - Va - Vc;
      
   end Calculate_Angles;
   
   procedure Hypothenus_Program is
      
      Hyp : Float;
      Kat : Integer;
      Kat2 : Integer;
      
   begin
      
      Put("Mata in kateternas längder: ");
      Get(Kat);
      Get(Kat2);
      Put("Hypotenusan är ");
      Hyp := Calculate_Hypothenuse(Kat, Kat2);
      Put(Hyp, Fore => 0, Aft => 2, Exp => 0);
      Skip_Line;
      
   end Hypothenus_Program;
   
   procedure Angle_Program is
      
      Hypothenuse : Float;
      Kat, Va, Vb, Vc : Float;
      
   begin
      
      Put("Mata in hypotenusans längd: ");
      Get(Hypothenuse);
      Put("Mata in vertikala katetens längd: ");
      Get(Kat);
      Calculate_Angles(Hypothenuse, Kat, Va, Vb, Vc);
      Put("Va: ");
      Put(Va, Fore => 0, Aft => 1, Exp => 0);
      Put(" grader");
      New_Line;
      Put("Vb: ");
      Put(Vb, Fore => 0, Aft => 1, Exp => 0);
      Put(" grader");
      New_Line;
      Put("Vc: ");
      Put(Vc, Fore => 0, Aft => 1, Exp => 0);
      Put(" grader");
      Skip_Line;
      
   end Angle_Program;
   
   Selection : Integer;
begin
   
   Put_Line("Välkommen till miniräknaren!");
   loop
      
      Menu_Selection(Selection);
      
      case Selection is
	 when 1 =>
	   Hypothenus_Program;
	   New_Line(2);
	 
	 when 2 =>
	   Angle_Program;
	   New_Line(2);
	 
	 when 3 =>
	   Factorial_Program;
	   New_Line(2);
	 
	   when others =>
	      Put("Ha en bra dag!");
	 exit;
      end case;
   end loop;
   
end Calculator;


