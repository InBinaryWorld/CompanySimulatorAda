with addingmachine;
with multimachine;
with constants;
package service is
   task type service(addMachArr : addingmachine.addMachArrAcc ;multiMachArr : multimachine.multiMachArrAcc) is
      entry damageAdd(idx: in Integer);
      entry damageMulti(idx : in Integer);
      entry pullToRepair(idx: out Integer);
      entry repairedAdd(idx: in Integer);
      entry repairedMulti(idx : in Integer);
   end service;
   type servicePtr is access service;
   type Q is array (1 .. constants.AddMach+constants.MultiMach) of Integer;
end service;
