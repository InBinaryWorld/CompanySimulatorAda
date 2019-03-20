with constants;
with job;
package warehouse is
   task type warehouse is
      entry pullResult(someJob : out job.jobPtr);
      entry pushResult(someJob : in job.jobPtr);
      entry wareCmd(cmd : in Integer);
   end warehouse;
   type whPtr is access warehouse;
   type T is array (1 .. constants.MaxResults) of job.jobPtr;
end wareHouse;
