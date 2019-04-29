with jobtable;
with warehouse;
with addingmachine;
with multimachine;
with job;
package worker is
   task type worker(id : Integer ; talkative : Boolean; JobTabPtr : jobtable.jobTabPtr; warePtr : warehouse.whPtr;
                    addMachArr : addingmachine.addMachArrAcc ;multiMachArr : multimachine.multiMachArrAcc) is
      entry pushCmd(cmd : in Integer);
   end worker;
   type workerArray is array(Positive range <>) of access worker;
   type workerArrAccess is access workerArray;
   function initWorkers(Size : Integer; talkative : Boolean; JobTabPtr : jobtable.jobTabPtr ;warePtr : warehouse.whPtr;
                       addMachArr : addingmachine.addMachArrAcc ;multiMachArr : multimachine.multiMachArrAcc) return workerArrAccess;

end worker;

