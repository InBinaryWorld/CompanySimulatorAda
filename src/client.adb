with job;
with Ada.Text_IO;
with random;
with constants;
package body client is
   task body client is
      someJob : job.jobPtr;
   begin
      loop
         warePtr.all.pullResult(someJob);
         if(talkative) then
            Ada.Text_IO.Put_Line("Client " & Integer'Image(id) & " take Task   "
                                 & Integer'Image(someJob.all.arg1) & someJob.all.operator
                                 & Integer'Image(someJob.all.arg2) & " =" & Integer'Image(someJob.all.result));
         end if;
         delay (random.get(40)+80) *constants.ClientSpeed * 0.001;
      end loop;
   end client;

   function initClients (Size : Integer; talkative : Boolean; warePtr : warehouse.whPtr ) return clientArrAccess is
      clientTabPtr : clientArrAccess;
   begin
      clientTabPtr := new clientArray(1 .. Size);
      for i in clientTabPtr.all'Range loop
         clientTabPtr.all(i):=new client(i,talkative,warePtr);
      end loop;
      return clientTabPtr;
   end initClients;
begin
   null;
end client;
