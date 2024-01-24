--joela064: Samarbetat med isahe131, Isaac Hedman, samma program
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Posttyp is
   
   --DS1
   type DS1 is
      record
	 W : Character;
	 P : String(1..4);
      end record;
   
   --DS2
   type DS2_Type is
      record
	 S : Float;
	 Z : String(1..4);
      end record;

   type DS2 is
      record
	 D : DS2_Type;
	 U : DS2_Type;
      end record;   
   
   --DS3
   type DS3_Type is
      record
	 Y, Q : Character;
      end record;
   
   type DS3_Type2 is
      record
	 T : Boolean;
	 L : Character;
      end record;
   
   type DS3 is
      record
	 J, B : DS3_Type;
	 O : DS3_Type2;
      end record;
   
   
   --DS1 Get
   procedure Get(Item : out DS1) is
      C : Character;
   begin
      Get(Item.W);
      Get(C);
      Get(Item.P);
   end Get;
   
   --DS2 Type Get
   procedure Get(Item : out DS2_Type) is
   C : Character;   
   begin
      Get(Item.S);
      Get(C);
      Get(Item.Z);
   end Get;
   
   
   --DS2 Get
   procedure Get(Item : out DS2) is
   begin
      Get(Item.D);
      Get(Item.U);
   end Get;
   
   --Get DS3 Type
   procedure Get(Item : out DS3_Type) is
      C : Character;
   begin
      Get(Item.Y);
      Get(C);
      Get(Item.Q);
      Get(C);
   end Get;
   
   --Get DS3 type 2
   procedure Get(Item : out DS3_Type2) is
      C : Character;
   begin
      --Hämtar Sista bokstaven
      Get(C);
      if C = 'T' or C = 't' then
	 Item.T := True;
      else
	 Item.T := False;
      end if;
      Get(C);
      Get(Item.L);
   end Get;
   
   --DS3 Get
   procedure Get(Item : out DS3) is
   begin
      Get(Item.J);
      Get(Item.B);
      Get(Item.O);
   end Get;
   
   
   --DS1 Put
   procedure Put(Item : in DS1) is
   begin
      Put(Item.W);
      Put(" ");
      Put(Item.P);
   end Put;
   
   --DS2 Type Put
   procedure Put(Item : in DS2_Type) is
   begin
      Put(Item.S, Fore => 0, Aft => 3, Exp => 0);
      Put(" ");
      Put(Item.Z);
      
   end Put;
   
   
   --DS2 Put
   procedure Put(Item : in DS2) is      
   begin
      Put(Item.D);
      Put(" ");
      Put(Item.U);
   end Put;
   
   --DS3 Type Put
   procedure Put(Item : in DS3_Type) is
   begin
      Put(Item.Y);
      Put(" ");
      Put(Item.Q);
      Put(" ");
   end Put;
   
   --DS3 Type 2 Put
   procedure Put(Item : in DS3_Type2) is
   begin
      if Item.T then
	 Put("True");
      else
	 Put("False");
      end if;
      Put(" ");
      Put(Item.L);
      
      
   end Put;
   --DS3 Put
   procedure Put(Item : in DS3) is
   begin
      Put(Item.J);
      Put(Item.B);
      Put(Item.O);
     end Put;
        
   DS : DS1;
   DSS : DS2;
   DSSS : DS3;
begin
   Put_Line("För DS1:");
   Put("Mata in datamängd: ");
   Get(DS);
   Put("Inmatad datamängd: ");
   Put(DS);
   New_Line(2);
   Put_Line("För DS2:");
   Put("Mata in datamängd: ");
   Get(DSS);
   Put("Inmatad datamängd: ");
   Put(DSS);
   New_Line(2);
   Put_Line("För DS3:");
   Put("Mata in datamängd: ");
   Get(DSSS);
   Put("Inmatad datamängd: ");
   Put(DSSS);
   
end Posttyp;
 
