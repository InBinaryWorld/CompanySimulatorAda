with job;
package multimachine is
   task type multimachine(id :Integer ;talkative : Boolean) is
      entry pullJob(someJob : out job.jobPtr);
      entry pushJob(someJob : in job.jobPtr);
      entry backdoor(cmd : in Integer);
   end multimachine;
   type multiMachinePtr is access all multimachine;   
   
   
   type multiMachArr is array(Positive range <>) of multiMachinePtr;
   type multiMachArrAcc is access multiMachArr;
   function initMultiMach(Size : Integer ; talkative : Boolean) return multiMachArrAcc;

end multimachine;
