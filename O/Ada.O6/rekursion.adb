-- joela064: Samarbetat med isahe131, Isaac Hedman, samma program
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Rekursion is
   
   --Fibbonacci
   function Fib(N : in Natural) return Positive is
      
   begin
      
      if N = 1 or N = 2 then
	 return 1;
      else
	 return Fib(N-1) + Fib(N-2);	 
      end if;
     
   end Fib;
   
   --Byggstenar
   function Leca(H : Natural) return Natural is
      
   begin
      
      if H = 1 then
	 return 0;
      elsif H = 2 then
	 return 1;
      else
	 -- + Leca(H-1) innebär att vi adderade förra våningens stenar på den nuvarande
	 return (H - 1) * (2 * H - 3) + Leca(H - 1);
      end if;
	  
      
   end Leca;
   
   
   N : Natural;
   H : Natural;
begin
   
   Put("Mata in N och H: ");
   Get(N);
   Get(H);
   Put("Fibonacci-tal nummer ");
   Put(N, Width => 0);
   N := Fib(N);
   Put(" är ");
   Put(N, Width => 0);
   Put_Line(".");
   Put("Det behövs ");
   H := Leca(H);
   Put(H, Width => 0);
   Put(" stenar för att bygga trappan.");

end Rekursion;
