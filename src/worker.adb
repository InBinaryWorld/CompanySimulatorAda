with job;
with jobtable;
with warehouse;
with Ada.Text_IO;
with random;
with constants;
package body worker is
   task body worker is
      someJob : job.jobPtr;
   begin
      loop
         jobTabPtr.pullJob(someJob);
         case someJob.all.operator is
            when '+' =>
               someJob.all.result := someJob.all.arg1 + someJob.all.arg2;
            when '-' =>
               someJob.all.result := someJob.all.arg1 - someJob.all.arg2;
            when '*' =>
               someJob.all.result := someJob.all.arg1 * someJob.all.arg2;
            when others =>
               null;
         end case;
         warePtr.all.pushResult(someJob);
         if(talkative) then
            Ada.Text_IO.Put_Line("Worker " & Integer'Image(id) & " resolve Task"
                                 & Integer'Image(someJob.all.arg1) & someJob.all.operator
                                 & Integer'Image(someJob.all.arg2) & " =" & Integer'Image(someJob.all.result));
         end if;
         delay (random.get(40)+80) *constants.WorkerSpeed * 0.001;
      end loop;
   end worker;

   function initWorkers(Size : Integer; talkative : Boolean; JobTabPtr : jobtable.jobTabPtr ;warePtr : warehouse.whPtr) return workerArrAccess is
      workerTabPtr : workerArrAccess;
   begin
      workerTabPtr := new workerArray(1 .. Size);
      for i in workerTabPtr.all'Range loop
         workerTabPtr.all(i):=new worker(i,talkative,jobTabPtr,warePtr);
      end loop;
      return workerTabPtr;
   end initWorkers;

begin
   null;
end worker;
