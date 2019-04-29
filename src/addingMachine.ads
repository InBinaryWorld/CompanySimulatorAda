with constants;
with job;
package addingmachine is
   task type addingmachine is
      entry pullJob(someJob : out job.jobPtr);
      entry pushJob(someJob : in job.jobPtr);
   end addingmachine;
   type addingMachinePtr is access all addingMachine;      
   
   type addMachArr is array(Positive range <>) of addingMachinePtr;
   type addMachArrAcc is access addMachArr;
   function initAddMach(Size : Integer) return addMachArrAcc;
end addingmachine;
