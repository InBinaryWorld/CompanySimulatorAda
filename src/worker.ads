with jobtable;
with warehouse;
with addingMachine;
with multiMachine;
with job;
package worker is
   task type worker(id : Integer ; talkative : Boolean; JobTabPtr : jobtable.jobTabPtr; warePtr : warehouse.whPtr;
                    addMachArr : addingMachine.addMachArrAcc ;multiMachArr : multiMachine.multiMachArrAcc) is
      entry pushCmd(cmd : in Integer);
   end worker;
   type workerArray is array(Positive range <>) of access worker;
   type workerArrAccess is access workerArray;
   function initWorkers(Size : Integer; talkative : Boolean; JobTabPtr : jobtable.jobTabPtr ;warePtr : warehouse.whPtr;
                       addMachArr : addingMachine.addMachArrAcc ;multiMachArr : multiMachine.multiMachArrAcc) return workerArrAccess;

end worker;

