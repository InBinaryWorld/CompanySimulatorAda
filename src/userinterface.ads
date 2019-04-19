with warehouse;
with jobtable;
with worker;
package userInterface is
   task type userInterface(jobTabPtr : jobtable.jobTabPtr ; warePtr : warehouse.whPtr ; workerArr : worker.workerArrAccess);
   type userAccess is access userInterface;
end userInterface;
