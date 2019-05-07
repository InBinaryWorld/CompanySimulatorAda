with constants;
with serviceman;
with Ada.Text_IO;
package body service is
   task body service is
      addIsFixing : array(1 .. constants.AddMach) of Boolean := (others => false);
      multiIsFixing : array(1 .. constants.MultiMach) of Boolean := (others => false);
      queue : Q :=(others => 0);
      qLen : Integer := 0;
   begin

      loop
         select
            accept damageAdd(idx: in Integer) do
               if addIsFixing(idx) = false then
                  addIsFixing(idx) := true;
                  qLen := qLen+1;
                  queue(qLen) := idx;
               end if;
            end damageAdd;
         or
            accept damageMulti(idx: in Integer) do
               if multiIsFixing(idx) = false then
                  multiIsFixing(idx) := true;
                  qLen := qLen+1;
                  queue(qLen) := idx+constants.AddMach;
               end if;
            end damageMulti;
         or
            when qLen > 0 =>
               accept pullToRepair(idx: out Integer) do
                  idx := queue(1);
                  queue(queue'First .. queue'last-1) := queue(queue'First+1 .. queue'Last);
                  queue(queue'Last) := 0;
                  qLen := qLen-1;
               end pullToRepair;
         or
            accept repairedAdd(idx: in Integer) do
               addIsFixing(idx) :=false;
            end repairedAdd;
         or
            accept repairedMulti(idx: in Integer) do
               multiIsFixing(idx) :=false;
            end repairedMulti;
         end select;
      end loop;
   end service;
end service;
