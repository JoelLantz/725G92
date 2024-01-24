-- joela064: Samarbetat med isahe131, Isaac Hedman, samma program
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Falt is
   
   
   type DS1 is
     array(31..35) of Float;
   
   type DS2_Type is
     array(Character range '5'..'9') of String(1..5);
   
   type DS2 is
     array(False..True) of DS2_Type;
   
   type DS3 is
     array(73..74, Character range '4'..'8') of Integer;
   
   
   --DELUPPGIFT 1
   procedure Get(Item : out DS1) is
   begin
      for Count in reverse DS1'Range
      loop
	 Get(Item(Count));
      end loop;            
   end Get;
   
   
   procedure Put(Item : in DS1) is
   begin
      for Count in reverse DS1'Range
      loop	 
	 Put(" ");
	 Put(Item(Count), Fore => 0, Aft => 3, Exp => 0);	 
      end loop;      
   end Put;
   
   
   --DELUPPGIFT 2  
   --Get DS2_Type
   procedure Get(Item : out DS2_Type) is
      C : Character;
   begin     
      for Count in reverse DS2_Type'Range
      loop
	 Get(Item(Count));
	 if Count > (DS2_Type'First) then	    
	   Get(C);
	 end if;	
      end loop;
   end Get;
     
   --Get DS2
   procedure Get(Item : out DS2) is
      C : Character;
   begin
      for Count in DS2'Range
      loop
	  Get(Item(Count));
	  if Count < DS2'Last then
	     Get(C);
	 end if;	 
      end loop;	      
   end Get;
      
   --Put DS2_Type
   procedure Put(Item : in DS2_Type) is
   begin
      for Count in reverse DS2_Type'Range
      loop
	 Put(" ");
	 Put(Item(Count));
      end loop;      
   end Put;
   
   --Put DS2
   procedure Put(Item : in DS2) is
   begin
      for Count in DS2'Range
      loop
	 Put(Item(Count));
      end loop;      
   end Put;
   
   
   --Deluppgift 3
   --Get DS3
   procedure Get(Item : out DS3) is

      C : Character;
      
   begin
      for I in DS3'Range(1) loop
	 for K in DS3'Range(2) loop
	    Get(Item(I, K));
	    if K < DS3'Last(2) then
	       Get(C);
	    end if;
	 end loop;
      end loop;
   end Get;
      
   --Put DS3 Type
   procedure Put(Item : in DS3) is
   begin      
      for I in DS3'Range(1) loop
	 for K in DS3'Range(2) loop
	    Put(" ");
	    Put(Item(I,K), Width => 0);
	 end loop;
      end loop;
   end Put;
      
   DS1_Arr : DS1;
   DS2_Arr : DS2;
   DS3_Arr : DS3;
      
begin
   --DS1
   Put_Line("För DS1:");
   Put("Mata in datamängd: ");
   Get(DS1_Arr);
   Put("Inmatad datamängd:");
   Put(DS1_Arr);
   Skip_Line;
   New_Line(2);
   
   --DS2
   Put_Line("För DS2:");
   Put("Mata in datamängd: ");
   Get(DS2_Arr);
   Put("Inmatad datamängd:");
   Put(DS2_Arr);   
   Skip_Line;
   New_Line(2);
   
   --DS3
   Put_Line("För DS3:");
   Put("Mata in datamängd: ");
   Get(DS3_Arr);
   Put("Inmatad datamängd:");
   Put(DS3_Arr);
   Skip_Line;
   
end Falt;

