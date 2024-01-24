with Ada.Text_IO; use Ada.Text_IO;

package Image_Handling is
   
   type  Image_Type is private;

   procedure Print_Image_Information(Item : in Image_Type);
   procedure Print_Image_Information(File : in File_Type ;
				     Item : in Image_Type);
   procedure Read(File_Name : in String;
		  Item : in out Image_Type);

private
   
   type Pixel_Type is
      record
	 R : Integer range 0..255;
	 G : Integer range 0..255;
	 B : Integer range 0..255;
	 Alpha : Boolean := False;
      end record;
   type Image_Area_Type is
     array(1..30,1..30) of Pixel_Type;
   
   type Image_Type is
      record
	 X_Dim : Integer;
	 Y_Dim : Integer;
	 Image_Area : Image_Area_Type;
      end record;
   
end Image_Handling;
