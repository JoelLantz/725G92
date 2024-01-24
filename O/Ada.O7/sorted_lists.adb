with Ada.Unchecked_Deallocation;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Sorted_Lists is
     
   procedure Free is
      new Ada.Unchecked_Deallocation(Data_Type, List_Type);
   
   
   --EMPTY
   function Empty(List : in List_Type) return Boolean is
   begin     
      return List = null;    
   end Empty;
   
   procedure InsertFirst(List : in out List_Type;
			 Value : in Integer) is
      Temp : List_Type;
   begin      
      if Empty(List) then
	 List := new Data_Type'(Value, null);
      else
	 Temp := new Data_Type'(Value, List);
	 List := Temp;
      end if;
      
   end InsertFirst;
   
   
   procedure Insert(List : in out List_Type ;
		    Value : in Integer) is
   begin
      
      if List = null or else List.Data > Value then
	 InsertFirst(List, Value);
      elsif List.Data = Value then
	 return;
      else
	 Insert(List.Next, Value);
      end if;
      
   end Insert;
   
   --PUT
   procedure Put(List : in List_Type) is
   begin
      if not Empty(List) then
	 Put(" ");
	 Put(List.Data, Width => 0);
	 Put(List.Next);
      end if;
      
   end Put;
   
   --MEMBER
   function Member(List : in List_Type ;
		   Nyckeltal : in Integer) return Boolean is
   begin
      if Empty(List) then
	 return False;
      elsif List.Data = Nyckeltal then
	 return True;
      else
	 return Member(List.Next, Nyckeltal);
      end if;
      
   end Member;
   
   
   --LENGTH
   function Length(List : in List_Type) return Natural is
      
   begin
      if List = null then
	 return 0;
      else
	 return 1 + Length(List.Next);
      end if;
      
   end Length;
   
   procedure Delete(List : in out List_Type) is
   begin
      
      if not Empty(List) then
	 Delete(List.Next);
	 Free(List);
      end if;
      
   end Delete;
   
   
   procedure Remove(List : in out List_Type ;
		    Value : Integer) is
      TempList : List_Type;
   begin
      if Empty(List) then
	 raise No_Such_Element_Error;
      elsif List.Data = Value then
	 TempList := List.Next;
	 Free(List);
	 List := TempList;
      else
	 Remove(List.Next, Value);
      end if;
      
   end Remove;
   
end Sorted_Lists;
