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

procedure Main is
   warePtr : warehouse.whPtr := new warehouse.warehouse;
   jobTabPtr : jobtable.jobTabPtr := new  jobtable.jobtable;
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
   else
      userI := new userInterface.userInterface(jobTabPtr,warePtr);
   end if;
    bossArr := boss.initBosses(constants.Bosses,talkative,jobTabPtr);
   workerArr := worker.initWorkers(constants.Workers,talkative,jobTabPtr,warePtr);
   clientArr := client.initClients(constants.Clients,talkative,warePtr);
end Main;
