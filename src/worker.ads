with jobtable;
with warehouse;
package worker is
   task type worker(id : Integer ; talkative : Boolean; JobTabPtr : jobtable.jobTabPtr; warePtr : warehouse.whPtr);
   type workerArray is array(Positive range <>) of access worker;
   type workerArrAccess is access workerArray;
   function initWorkers(Size : Integer; talkative : Boolean; JobTabPtr : jobtable.jobTabPtr ;warePtr : warehouse.whPtr) return workerArrAccess;

end worker;
