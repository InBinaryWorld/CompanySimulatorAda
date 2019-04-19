with job;
with jobtable;
with warehouse;
with Ada.Text_IO;
with random;
with constants;
with random;

package body worker is
   task body worker is
      someJob : job.jobPtr;
      isPatient : Integer;
      idx : Integer;
      maxIdx : Integer;
      counter : Integer :=0;
      done : boolean := false;
   begin
      isPatient := random.get(2);
      loop

         select
            accept pushCmd(cmd : in Integer) do
               if (cmd = 1) then
                  Ada.Text_IO.Put_Line("Worker " & id'Image & " Patient: " & isPatient'Image & " counter: " & counter'Image);
               end if;
            end pushCmd;
         else
            null;
         end select;

         jobTabPtr.pullJob(someJob);

         if(talkative) then
            Ada.Text_IO.Put_Line("Worker " & Integer'Image(id) & " resolve Task"
                                 & Integer'Image(someJob.all.arg1) & someJob.all.operator
                                 & Integer'Image(someJob.all.arg2) & " =" & Integer'Image(someJob.all.result));
         end if;

         case someJob.all.operator is
            when '*' =>
            maxIdx := constants.MultiMach;
            idx := random.get(maxIdx)+1;
            if isPatient = 1 then
               multiMachArr.all(idx).pushJob(someJob);
               multiMachArr.all(idx).pullJob(someJob);

            else
               done :=false;
               while done = false loop
                  select
                     multiMachArr.all(idx).pushJob(someJob);
                     multiMachArr.all(idx).pullJob(someJob);
                     done :=true;
                  or
                     delay constants.Unpatient;
                     idx := idx +1;
                     if idx = maxIdx then
                        idx := 0;
                     end if;
                  end select;
               end loop;
            end if;


         when others =>
            maxIdx := constants.AddMach;
            idx := random.get(maxIdx)+1;

            if isPatient = 1 then
               addMachArr.all(idx).pushJob(someJob);
               addMachArr.all(idx).pullJob(someJob);

            else
               done :=false;
               while done = false loop
                  select
                     addMachArr.all(idx).pushJob(someJob);
                     addMachArr.all(idx).pullJob(someJob);
                     done := true;
                  or
                     delay constants.Unpatient;
                     idx := idx +1;
                     if idx = maxIdx then
                        idx := 0;
                     end if;
                  end select;
               end loop;
            end if;


         end case;
         counter:= counter +1;
         warePtr.all.pushResult(someJob);
         delay constants.WorkerSpeed ;
      end loop;
   end worker;

   function initWorkers (Size : Integer; talkative : Boolean; JobTabPtr : jobtable.jobTabPtr ;warePtr : warehouse.whPtr;
                       addMachArr : addingMachine.addMachArrAcc ;multiMachArr : multiMachine.multiMachArrAcc) return workerArrAccess is
      workerTabPtr : workerArrAccess;
   begin
      workerTabPtr := new workerArray(1 .. Size);
      for i in workerTabPtr.all'Range loop
         workerTabPtr.all(i):=new worker(i,talkative,jobTabPtr,warePtr,addMachArr,multiMachArr);
      end loop;
      return workerTabPtr;
   end initWorkers;

begin
   null;
end worker;
