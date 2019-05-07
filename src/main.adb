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
with service;
with serviceman;
procedure Main is
   warePtr : warehouse.whPtr := new warehouse.warehouse;
   jobTabPtr : jobtable.jobTabPtr := new  jobtable.jobtable;
   userI : userInterface.userAccess ;

   servicePtr : service.servicePtr ;
   servicemanArr : serviceman.servicemanArrAcc;

   addMachArr : addingMachine.addMachArrAcc;
   multiMachArr : multiMachine.multiMachArrAcc;

   bossArr : boss.bossArrAccess ;
   workerArr : worker.workerArrAccess ;
   clientArr : client.clientArrAccess ;

   talkative : Boolean := false;
   intTalk : Integer ;

begin
   Ada.Text_IO.Put ("1 - Talkative , others - Silent :");
   Ada.Integer_Text_IO.Get (intTalk);
   if intTalk = 1 then
      talkative := true;
   end if;

   addMachArr := addingMachine.initAddMach(constants.AddMach,talkative);
   multiMachArr := multiMachine.initMultiMach(constants.MultiMach,talkative);

   servicePtr := new service.service(addMachArr,multiMachArr);
   servicemanArr := serviceman.initServiceman(constants.Servisants,servicePtr,addMachArr,multiMachArr,talkative);

   bossArr := boss.initBosses(constants.Bosses,talkative,jobTabPtr);
   workerArr := worker.initWorkers(constants.Workers,talkative,jobTabPtr,warePtr,addMachArr,multiMachArr,servicePtr);
   clientArr := client.initClients(constants.Clients,talkative,warePtr);

   if talkative = false then
      userI := new userInterface.userInterface(jobTabPtr,warePtr,workerArr);
   end if;
end Main;
