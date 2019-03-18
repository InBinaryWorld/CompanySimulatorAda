
with constants;
with job;
package jobTable is
   task type jobTable is
      entry pullJob(someJob : out job.jobPtr);
      entry pushJob(someJob : in job.jobPtr);
      entry jobCmd(cmd : in Integer);
   end jobTable;
   type T is array (1 .. constants.MaxJobs) of job.jobPtr;
   type jobTabPtr is access all jobTable;
end jobTable;
