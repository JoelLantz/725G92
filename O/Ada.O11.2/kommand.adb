-- joela064: Samarbetat med isahe131, Isaac Hedman, samma program
with Ada.Command_Line; with Ada.Text_IO; with Ada.Integer_Text_IO;
use Ada.Command_Line; use Ada.Text_IO; use Ada.Integer_Text_IO;

procedure Kommand is
   
   Output_Error  : exception;
   Input_Error   : exception;
   Input_Output_Error : exception;
   
   function Punkt1(Item1, Item2 : in String) return Boolean is
      
   begin
      
      return Item1(Item1'First+2..Item1'Last) = Item2(Item2'First..Item2'Last) or Item2(Item2'First+2..Item2'Last) = Item1(Item1'First..Item1'Last);
      
   end Punkt1;
   
   --Skulle nog gå att lägga Arg1 = Command name, Arg2 = Command_Name och Arg1 = Arg2 i Punkt1...
   procedure Upg2(Arg1, Arg2, Arg3 : in String) is
      
   begin
      if Arg1 = Command_Name or Punkt1(Arg1, Command_Name) then
	 raise Input_Error;
      elsif Arg2 = Command_Name or Punkt1(Arg2, Command_Name)then
	 raise Output_Error;
      elsif Arg1 = Arg2 or Punkt1(Arg1, Arg2) then
	 raise Input_Output_Error;
      end if;
      
   end Upg2;
   
   --I Huvudprogrammet kollas  om Argument_Count = 3 så kör vi detta
   procedure Upg1(Arg1, Arg2, Arg3 : in String) is
      
   begin	 
      Put("Meddelande: ");
      for Count in 1..Integer'Value(Arg3)
      loop
	 Put(Argument(1));
      end loop;
      Put_Line(Argument(2));
      Put("Programmet """ & Command_Name & """ avslutas.");      
   end Upg1;
   
begin      
   --Kör UPG1 om Argument_Count är 
   if Argument_Count = 3 then
      Upg2(Argument(1), Argument(2), Argument(3));
      Upg1(Argument(1), Argument(2), Argument(3));   
   elsif Argument_Count = 0 then
      Put("Inga argument angivna.");
   else
      Put("Fel antal argument angivna.");    
   end if;
   
exception
   when Output_Error =>
      Put("Error! Output file """ & Command_Name & """ cannot be same as the program itself!");
   when Input_Error =>
      Put("Error! Input file """ & Command_Name & """ cannot be same as the program itself!");
   when Input_Output_Error =>
      Put("Error! Output file """ & Argument(2) & """ cannot be same as input file!");
      
end Kommand;
