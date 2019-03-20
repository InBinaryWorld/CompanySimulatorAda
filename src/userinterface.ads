with warehouse;
with jobtable;
package userInterface is
   task type userInterface(jobTabPtr : jobtable.jobTabPtr ; warePtr : warehouse.whPtr);
   type userAccess is access userInterface;
   function initUser ( JobTabPtr : jobtable.jobTabPtr ; warePtr : warehouse.whPtr )return userAccess;
end userInterface;
