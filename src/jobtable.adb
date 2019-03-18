package body jobtable is

   task body jobtable is
      wh: T:=(others=>null);
      length : Natural :=0;
   begin
      loop
         select
            accept jobCmd(cmd : in Integer) do
               case cmd is
                  when 1 =>
                     for i in wh'Range loop
                        if wh(i) not in null then
                           job.printJobWithoutResult(wh(i));
                        end if;
                     end loop;
                  when others =>
                     null;
               end case;
            end jobCmd;
         or
            when length > 0 =>
               accept pullJob(someJob : out job.jobPtr) do
                  someJob := wh(wh'First);
                  wh(wh'First .. wh'last-1) := wh(wh'First+1 .. wh'Last);
                  wh(wh'Last) := null;
               end pullJob;
               length:=length-1;
         or
            when length < constants.MaxJobs =>
               accept pushJob(someJob : in job.jobPtr) do
                  for i in wh'Range loop
                     if wh(i) in null then
                        wh(i) := someJob;
                        exit;
                     end if;
                  end loop;
               end pushJob;
               length:=length+1;
         end select;
      end loop;
   end jobtable;

end jobtable;
