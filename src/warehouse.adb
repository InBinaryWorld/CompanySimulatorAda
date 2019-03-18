package body warehouse is

   task body warehouse is
      wh: T:=(others=>null);
      length : Natural :=0;
   begin
      loop
         select
            accept wareCmd(cmd : in Integer) do
               case cmd is
                  when 1 =>
                     for i in wh'Range loop
                        if wh(i) not in null then
                           job.printJob(wh(i));
                        end if;
                     end loop;
                  when others =>
                     null;
               end case;
            end wareCmd;
         or
            when length > 0 =>
               accept pullResult(someJob : out job.jobPtr) do
                  someJob := wh(wh'First);
                  wh(wh'First .. wh'last-1) := wh(wh'First+1 .. wh'Last);
                  wh(wh'Last) := null;
               end pullResult;
               length:=length-1;
         or
            when length < constants.MaxResults =>
               accept pushResult(someJob : in job.jobPtr) do
                  for i in wh'Range loop
                     if wh(i) in null then
                        wh(i) := someJob;
                        exit;
                     end if;
                  end loop;
               end pushResult;
               length:=length+1;
         end select;
      end loop;
   end warehouse;

end warehouse;
