with job;
with warehouse;
with jobtable;
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with constants;
with random;
--with boss;
procedure Main is
   ware : warehouse.warehouse;
   jobTab : jobtable.jobtable;

   task type boss(id : Integer ; talkative : Boolean);
   task body boss is
      operators : array (0 .. 2) of Character;
      someJob : job.jobPtr;
   begin
      operators := ('+','-','*');
      loop
         someJob := new job.job'(random.get(1000),random.get(1000),
                              operators(random.get(2)),0);
         jobTab.pushJob(someJob);

         if(talkative) then
            Ada.Text_IO.Put_Line("Boss   " & Integer'Image(id) & " push Task   "
                                 & Integer'Image(someJob.all.arg1) & someJob.all.operator
                                 & Integer'Image(someJob.all.arg2));
         end if;
         delay (random.get(40)+80) *constants.BossSpeed * 0.001;
      end loop;
   end boss;

   task type worker(id : Integer ; talkative : Boolean);
   task body worker is
      someJob : job.jobPtr;
   begin
      loop
         jobTab.pullJob(someJob);
         case someJob.all.operator is
            when '+' =>
               someJob.all.result := someJob.all.arg1 + someJob.all.arg2;
            when '-' =>
               someJob.all.result := someJob.all.arg1 - someJob.all.arg2;
            when '*' =>
               someJob.all.result := someJob.all.arg1 * someJob.all.arg2;
            when others =>
               null;
         end case;
         ware.pushResult(someJob);
         if(talkative) then
            Ada.Text_IO.Put_Line("Worker " & Integer'Image(id) & " resolve Task"
                                 & Integer'Image(someJob.all.arg1) & someJob.all.operator
                                 & Integer'Image(someJob.all.arg2) & " =" & Integer'Image(someJob.all.result));
         end if;
         delay (random.get(40)+80) *constants.WorkerSpeed * 0.001;
      end loop;
   end worker;


   task type client(id : Integer ; talkative : Boolean);
   task body client is
      someJob : job.jobPtr;
   begin
      loop
         ware.pullResult(someJob);
         if(talkative) then
            Ada.Text_IO.Put_Line("Client " & Integer'Image(id) & " take Task   "
                                 & Integer'Image(someJob.all.arg1) & someJob.all.operator
                                 & Integer'Image(someJob.all.arg2) & " =" & Integer'Image(someJob.all.result));
         end if;
         delay (random.get(40)+80) *constants.ClientSpeed * 0.001;
      end loop;
   end client;


   task type userInterface;
   task body userInterface is
      version : Integer;
   begin
      loop
         Ada.Text_IO.Put_Line("1-Show TaskTable 2-Show Warehouse");
         Ada.Text_IO.Put("Option: ");
         Ada.Integer_Text_IO.Get (version);
         case version is
            when 1 =>
               jobTab.jobCmd(1);
            when 2 =>
               ware.wareCmd(1);
            when others =>
               null;
         end case;
      end loop;
   end userInterface;



   talkative : Boolean := false;
   intTalk : Integer ;


begin
   Ada.Text_IO.Put ("1 - Talkative , others - Silent :");
   Ada.Integer_Text_IO.Get (intTalk);
   if intTalk = 1 then
      talkative := true;
   end if;
   declare
      bosses : array (1 .. constants.Bosses) of boss(0,talkative);              -- How increment id property???
      workers : array (1 .. constants.Workers) of worker(0,talkative);
      clients : array (1 .. constants.Clients) of client(0,talkative);
   begin
      if not talkative then
         declare
            userI : userInterface;
         begin
            null;
         end;

      end if;
   end;
end Main;
