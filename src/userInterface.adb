with jobtable;
with warehouse;
with Ada.Text_IO;
with Ada.Integer_Text_IO;
package body userInterface is
   task body userInterface is
      version : Integer;
   begin
      loop
         Ada.Text_IO.Put_Line("1-Show TaskTable 2-Show Warehouse");
         Ada.Text_IO.Put("Option: ");
         Ada.Integer_Text_IO.Get (version);
         case version is
            when 1 =>
               jobTabPtr.all.jobCmd(1);
            when 2 =>
               warePtr.all.wareCmd(1);
            when others =>
               null;
         end case;
      end loop;
   end userInterface;

   function initUser ( JobTabPtr : jobtable.jobTabPtr ; warePtr : warehouse.whPtr )return userAccess is
      userPtr : userAccess:= new userInterface(jobTabPtr,warePtr);
   begin
      return userPtr;
   end initUser;
begin
   null;
end userInterface;
