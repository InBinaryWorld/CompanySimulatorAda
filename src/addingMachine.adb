with job;
package body addingMachine is
   task body addingMachine is
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

                  case someJob.all.operator is
                     when '+' =>
                        someJob.all.result := someJob.all.arg1 + someJob.all.arg2;
                     when '-' =>
                        someJob.all.result := someJob.all.arg1 - someJob.all.arg2;
                     when others =>
                        null;
                  end case;
                  myJob := someJob;
                  done := true;

               end pushJob;
         end select;
         delay (constants.AddMachSpeed);
      end loop;
   end addingMachine;

   function initAddMach(Size : Integer) return addMachArrAcc is
      addMachTabPtr : addMachArrAcc;
   begin
      addMachTabPtr := new addMachArr(1 .. Size);
      for i in addMachTabPtr.all'Range loop
         addMachTabPtr.all(i):= new addingMachine;
      end loop;
      return addMachTabPtr;
   end initAddMach;


end addingMachine;
