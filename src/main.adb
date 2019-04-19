with job;
with warehouse;
with jobtable;
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with constants;
with random;
with boss;
with worker;
with client;
with userInterface;
with addingMachine;
with multiMachine;
procedure Main is
   warePtr : warehouse.whPtr := new warehouse.warehouse;
   jobTabPtr : jobtable.jobTabPtr := new  jobtable.jobtable;

   addMachArr : addingMachine.addMachArrAcc;
   multiMachArr : multiMachine.multiMachArrAcc;

   bossArr : boss.bossArrAccess ;
   workerArr : worker.workerArrAccess ;
   clientArr : client.clientArrAccess ;
   userI : userInterface.userAccess ;

   talkative : Boolean := false;
   intTalk : Integer ;

begin
   Ada.Text_IO.Put ("1 - Talkative , others - Silent :");
   Ada.Integer_Text_IO.Get (intTalk);
   if intTalk = 1 then
      talkative := true;
   end if;

   addMachArr := addingMachine.initAddMach(constants.AddMach);
   multiMachArr := multiMachine.initMultiMach(constants.MultiMach);

   bossArr := boss.initBosses(constants.Bosses,talkative,jobTabPtr);
   workerArr := worker.initWorkers(constants.Workers,talkative,jobTabPtr,warePtr,addMachArr,multiMachArr);
   clientArr := client.initClients(constants.Clients,talkative,warePtr);

   if talkative = false then
      userI := new userInterface.userInterface(jobTabPtr,warePtr,workerArr);
   end if;
end Main;
