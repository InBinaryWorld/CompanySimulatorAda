with constants;
with job;
package addingmachine is
   task type addingmachine(id :Integer ;talkative : Boolean) is
      entry pullJob(someJob : out job.jobPtr);
      entry pushJob(someJob : in job.jobPtr);
      entry backdoor(cmd : in Integer);
   end addingmachine;
   type addingMachinePtr is access all addingMachine;      
   
   type addMachArr is array(Positive range <>) of addingMachinePtr;
   type addMachArrAcc is access addMachArr;
   function initAddMach(Size : Integer; talkative : Boolean) return addMachArrAcc;
end addingmachine;
