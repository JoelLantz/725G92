-- joela064: Samarbetat med isahe131, Isaac Hedman, samma program

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;


procedure Inut is
   
   FirstPrice, LastPrice, Pum, Mprocent, Steg, PmMoms, Moms, C : Float := 0.0;
   B : Integer;
   
begin
   
   loop
      Put("Första pris: ");
      Get(FirstPrice);
      if FirstPrice > 0.0 then	 
	 exit;
      else
	 Put("Felaktigt värde!");
	 Skip_Line;
	 New_Line;
      end if;	
   end loop;
     

   loop
      Put("Sista pris: ");
      Get(LastPrice);
      if LastPrice >= FirstPrice then
	 exit;
      else
	 Put("Felaktigt värde!");
	 Skip_Line;
	 New_Line;
      end if;
   end loop;

   
   loop         
      Put("Steg: ");
      Get(Steg);
      if Steg > 0.0 then
	 exit;
      else
	 Put("Felaktigt värde!");
	 Skip_Line;
	 New_Line;
      end if;   
   end loop;
  
   
   loop
      Put("Momsprocent: ");
      Get(Mprocent);
      if Mprocent >= 0.0 and Mprocent <= 100.0 then
	 exit;
      else
	 Put("Felaktigt värde!");
	 Skip_Line;
	 New_Line;
      end if;     
   end loop;
   
   
   New_Line;
   
   Pum := FirstPrice;
   
   Put("============ Momstabell ============");
   New_Line;
   Put("Pris utan moms");
   Put("  ");
   Put("Moms");
   Put("   ");
   Put("Pris med moms");
   New_Line;
   
   C := ((LastPrice - FirstPrice)/Steg);
   B := Integer(Float'Floor(C));
   
   for Count in 0..B loop
      
      PmMoms := Pum * (Mprocent *0.01 + 1.0);
      Moms := PmMoms - Pum;
      
      Put(Pum, Fore => 6, Aft => 2, Exp => 0);
      Put(Moms, Fore => 8, Aft => 2, Exp => 0);
      Put(PmMoms, Fore => 9, Aft => 2, Exp => 0);
      
      Pum := Pum + Steg;
      New_Line;
      

   end loop;
   
   
end Inut;
