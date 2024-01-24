package Sorted_Lists is
   
   
   type Data_Type is private;
   type List_Type is private;

   
   function Empty(List : in List_Type)
		 return Boolean;
   procedure Insert(List : in out List_Type;
		    Value : in Integer);
   procedure Put(List : in List_Type);
   function Member(List : in List_Type ;
		   Nyckeltal : in Integer)
		  return Boolean;
   function Length(List : in List_Type)
		  return Natural;
   procedure Delete(List : in out List_Type);
   procedure Remove(List : in out List_Type ;
		    Value : Integer);  
   
   No_Such_Element_Error : exception;
   
private
   
   type Data_Type is
      record
	 Data : Integer;	 
	 Next : List_Type;
      end record;  
   type List_Type is
     access Data_Type;

end Sorted_Lists;
