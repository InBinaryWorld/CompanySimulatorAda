with job;
with constants;
package body multiMachine is
   task body multiMachine is
      myJob : job.jobPtr;
      done : boolean := false;
   begin
      myJob := null;
      loop
         select
            when done = true =>
               accept pullJob(someJob : out job.jobPtr) do
                  someJob := myJob;
                  done := false;
               end pullJob;
         or
            when done = false =>
               accept pushJob (someJob : in job.jobPtr) do
                  someJob.all.result := someJob.all.arg1 * someJob.all.arg2;
                  myJob := someJob;
                  done := true;
               end pushJob;
         end select;
         delay (constants.MultiMachSpeed);
      end loop;
   end multiMachine;



   function initMultiMach(Size : Integer) return multiMachArrAcc is
      multiMachTabPtr : multiMachArrAcc;
   begin
      multiMachTabPtr := new multiMachArr(1 .. Size);
      for i in multiMachTabPtr.all'Range loop
         multiMachTabPtr.all(i):= new multiMachine;
      end loop;
      return multiMachTabPtr;
   end initMultiMach;




end multiMachine;
