with service;
with addingmachine;
with multimachine;
package serviceman is

   task type serviceman(id : Integer ; servicePtr : service.servicePtr; addMachArr : addingmachine.addMachArrAcc 
                        ;multiMachArr : multimachine.multiMachArrAcc ;talkative : Boolean);
   type servicemanArray is array(Positive range <>) of access serviceman;
   type servicemanArrAcc is access servicemanArray;
   function initServiceman(Size : Integer; servicePtr : service.servicePtr; addMachArr : addingmachine.addMachArrAcc 
                        ;multiMachArr : multimachine.multiMachArrAcc; talkative : Boolean) return servicemanArrAcc;
end serviceman;
