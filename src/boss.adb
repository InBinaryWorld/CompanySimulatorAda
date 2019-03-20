with job;
with jobtable;
with random;
with Ada.Text_IO;
with constants;
package body boss is
   task body boss is
      operators : array (0 .. 2) of Character;
      someJob : job.jobPtr;
   begin
      operators := ('+','-','*');
      loop
         someJob := new job.job'(random.get(1000),random.get(1000),
                              operators(random.get(2)),0);
         jobTabPtr.all.pushJob(someJob);

         if(talkative) then
            Ada.Text_IO.Put_Line("Boss   " & Integer'Image(id) & " push Task   "
                                 & Integer'Image(someJob.all.arg1) & someJob.all.operator
                                 & Integer'Image(someJob.all.arg2));
         end if;
         delay (random.get(40)+80) *constants.BossSpeed * 0.001;
      end loop;
   end boss;


   function initBosses(Size : Integer; talkative : Boolean; jobTabPtr : jobtable.jobTabPtr ) return bossArrAccess is
      bossTabPtr : bossArrAccess;
   begin
      bossTabPtr := new bossArray(1 .. Size);
      for i in bossTabPtr.all'Range loop
         bossTabPtr.all(i) := new boss(i,talkative,jobTabPtr);
      end loop;
      return bossTabPtr;
   end initBosses;
end boss;
