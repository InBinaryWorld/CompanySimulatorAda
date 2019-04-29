with job;
package multimachine is
   task type multimachine is
      entry pullJob(someJob : out job.jobPtr);
      entry pushJob(someJob : in job.jobPtr);
   end multimachine;
   type multiMachinePtr is access all multimachine;   
   
   
   type multiMachArr is array(Positive range <>) of multiMachinePtr;
   type multiMachArrAcc is access multiMachArr;
   function initMultiMach(Size : Integer) return multiMachArrAcc;

end multimachine;
