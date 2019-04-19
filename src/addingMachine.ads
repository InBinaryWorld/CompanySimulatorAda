with constants;
with job;
package addingMachine is
   task type addingMachine is
      entry pullJob(someJob : out job.jobPtr);
      entry pushJob(someJob : in job.jobPtr);
   end addingMachine;
   type addingMachinePtr is access all addingMachine;      
   
   type addMachArr is array(Positive range <>) of addingMachinePtr;
   type addMachArrAcc is access addMachArr;
   function initAddMach(Size : Integer) return addMachArrAcc;
end addingMachine;
