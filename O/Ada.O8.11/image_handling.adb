with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use  Ada.Text_IO;

package body Image_Handling is
   
   -----------------------------------------------------   
   --Puttar in i filen, vad det är för färg/transparans
   procedure Put(File  : in File_Type ;
		 Pixel : in Pixel_Type) is
      
   begin
      
      Put(File, Pixel.R, Width => 4);
      Put(File, Pixel.G, Width => 4);
      Put(File, Pixel.B, Width => 4);
      Put(File, " ");
      
      if Pixel.Alpha then
	 Put(File, "True ");
      else
	 Put(File, "False");
      end if;      
      
   end Put;
   
   -----------------------------------------------------
   
   procedure Put(File : in File_Type ;
		 Item : in Image_Type) is
   begin
      
      for I in 1..Item.X_Dim loop
	 for K in 1..Item.Y_Dim loop
	    Put(File, Item.Image_Area(I, K));
	 end loop;
	 New_Line(File);
      end loop;    
      
   end Put;
   
   -----------------------------------------------------   
   -- PRINT IMAGE INFORMATION IMAGE TYPE
   procedure Print_Image_Information(Item : in Image_Type) is
      
   begin
      
      Print_Image_Information(Standard_Output, Item);
      
   end Print_Image_Information;
   
   -----------------------------------------------------
   --PRINT IMAGE INFORMATION MED FILEN  
   procedure Print_Image_Information(File : in File_Type ;
				     Item : in Image_Type) is
   begin
      
      Put(File, Item);
      
   end Print_Image_Information;
   
   -----------------------------------------------------
   
   --Return true om det är pbma
   function Is_Pbma(File : in File_Type) return Boolean is
      C : Character;
   begin
      
      while not End_Of_Line(File) loop
	 Get(File, C);
      end loop;
      
      return C = 'a';
      
   end Is_Pbma;
   
   -----------------------------------------------------
   
   -- ASSIGN COLOR
   procedure Assign_Color(File :          in File_Type ;
			  Item :          in out Image_Type ;
			  C :             in Character ;
			  Count, Count2 : in Integer) is      
   begin
      --0 ÄR VITT, 1 ÄR SVART
      if C = '0' then
	 Item.Image_Area(Count, Count2).R :=  255;
	 Item.Image_Area(Count, Count2).G :=  255;
	 Item.Image_Area(Count, Count2).B :=  255;
      elsif C = '1' then
	 Item.Image_Area(Count, Count2).R := 0;
	 Item.Image_Area(Count, Count2).G := 0;
	 Item.Image_Area(Count, Count2).B := 0;
      end if;
      
   end Assign_Color;
   
   -----------------------------------------------------
   
   --Get pbm
   procedure Get_Pbm(File : in File_Type ;
		     Item : in out Image_Type) is
      C : Character;
   begin
      
      for Count in 1..Item.Y_Dim loop
	 --Loopar igenom hela raden siffra för siffra, 1 = svart, 0 = vit
	 for Count2 in 1..Item.X_Dim loop
	    Get(File, C);
	    Assign_Color(File, Item, C, Count, Count2);
	 end loop;
      end loop;   
      
   end Get_Pbm;
   
   -----------------------------------------------------
   
   procedure Get_Pbma(File : in File_Type ;
		      Item : in out Image_Type) is
      C, Transp : Character;
   begin
      
      for Count in 1..Item.Y_Dim loop
	 --Loopar igenom hela raden siffra för siffra, 1 = svart, 0 = vit
	 for Count2 in 1..Item.X_Dim loop
	    Get(File, C);
	    Get(File, Transp);	      
	    Assign_Color(File, Item, C, Count, Count2);
	    if Transp = '1' then
	       Item.Image_Area(Count, Count2).Alpha := True;
	    end if;
	 end loop;
      end loop;    
      
   end Get_Pbma;
   
   -----------------------------------------------------
   
   procedure Check_Pixel_Count(File : in File_Type ;
			       Item : in out Image_Type;
			       X, Y :    out Integer) is   
      Temp : Boolean;
   begin  
      Temp := Is_Pbma(File);
      
      Skip_Line(File);
      Skip_Line(File);
      Get(File, X);
      Get(File, Y);
      Item.X_Dim := X;
      Item.Y_Dim := Y;
      if Temp = True then
	 Get_Pbma(File, Item);
      else
	 Get_Pbm(File, Item);
      end if;
      
   end Check_Pixel_Count;
   
   -----------------------------------------------------
   --READ
   procedure Read(File_Name : in String;
		  Item : in out Image_Type) is
      File : File_Type;
      X, Y : Integer;
   begin
      Open(File, In_File, File_Name);
      Check_Pixel_Count(File, Item, X, Y);
      Close(File);
   end Read;
   
end Image_Handling;
