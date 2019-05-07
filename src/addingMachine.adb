with job;
with random;
with Ada.Text_IO;
package body addingmachine is
   task body addingmachine is
      isBroken : Boolean := false;
      myJob : job.jobPtr;
      done : boolean := false;
   begin
      myJob := null;
      loop
         select
            accept backdoor(cmd : in Integer) do
               if cmd = 1 then
                  isBroken := false;
               end if;
            end backdoor;
         or
            when done = true =>
               accept pullJob(someJob : out job.jobPtr) do
                  someJob := myJob;
                  done := false;
               end pullJob;
         or
            when done = false =>
               accept pushJob (someJob : in job.jobPtr) do
                  if isBroken = false then
                     if talkative then
                        Ada.Text_IO.Put_Line("Add    " & id'Image & " do          " & someJob.all.arg1'Image
                                             & someJob.all.operator & someJob.all.arg2'Image );
                     end if;
                     case someJob.all.operator is
                     when '+' =>
                        someJob.all.result := someJob.all.arg1 + someJob.all.arg2;
                     when '-' =>
                        someJob.all.result := someJob.all.arg1 - someJob.all.arg2;
                     when others =>
                        null;
                     end case;
                     someJob.all.isDone := true;
                     isBroken := random.get(100) < constants.PropOfMachDamage;
                  else
                     if talkative then
                        Ada.Text_IO.Put_Line("Add    " & id'Image & " do          " & someJob.all.arg1'Image
                                             & someJob.all.operator & someJob.all.arg2'Image & " BROKEN!!");
                     end if;
                  end if;
                  myJob := someJob;
                  done := true;

               end pushJob;
               delay (constants.AddMachSpeed);
         end select;
      end loop;
   end addingmachine;

   function initAddMach(Size : Integer;talkative : Boolean) return addMachArrAcc is
      addMachTabPtr : addMachArrAcc;
   begin
      addMachTabPtr := new addMachArr(1 .. Size);
      for i in addMachTabPtr.all'Range loop
         addMachTabPtr.all(i):= new addingMachine(i,talkative);
      end loop;
      return addMachTabPtr;
   end initAddMach;


end addingmachine;

