with job;
with constants;
with random ;
with Ada.Text_IO;
package body multimachine is
   task body multimachine is
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
                     if(talkative) then
                        Ada.Text_IO.Put_Line("Multi  " & id'Image & " do          " & someJob.all.arg1'Image
                                             & someJob.all.operator & someJob.all.arg2'Image );
                     end if;
                     someJob.all.result := someJob.all.arg1 * someJob.all.arg2;
                     someJob.all.isDone := true;
                     isBroken := random.get(100) < constants.PropOfMachDamage;
                  else
                     if(talkative) then
                        Ada.Text_IO.Put_Line("Multi  " & id'Image & " do          " & someJob.all.arg1'Image
                                             & someJob.all.operator & someJob.all.arg2'Image & " BROKEN!!");
                     end if;
                  end if;
                  myJob := someJob;
                  done := true;
               end pushJob;
               delay (constants.MultiMachSpeed);
         end select;
      end loop;
   end multimachine;



   function initMultiMach(Size : Integer; talkative : Boolean) return multiMachArrAcc is
      multiMachTabPtr : multiMachArrAcc;
   begin
      multiMachTabPtr := new multiMachArr(1 .. Size);
      for i in multiMachTabPtr.all'Range loop
         multiMachTabPtr.all(i):= new multiMachine(i,talkative);
      end loop;
      return multiMachTabPtr;
   end initMultiMach;




end multimachine;
