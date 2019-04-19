with job;
package multiMachine is
   task type multiMachine is
      entry pullJob(someJob : out job.jobPtr);
      entry pushJob(someJob : in job.jobPtr);
   end multiMachine;
   type multiMachinePtr is access all multiMachine;   
   
   
   type multiMachArr is array(Positive range <>) of multiMachinePtr;
   type multiMachArrAcc is access multiMachArr;
   function initMultiMach(Size : Integer) return multiMachArrAcc;

end multiMachine;
