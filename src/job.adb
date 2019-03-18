with Ada.Text_IO;
package body job is
   procedure printJobWithoutResult(someJobPtr : jobPtr) is
      someJob : job := someJobPtr.all;
   begin
      Ada.Text_IO.Put_Line(Integer'Image(someJob.arg1) & ' ' & someJob.operator & Integer'Image(someJob.arg2));
   end printJobWithoutResult;
   procedure printJob(someJobPtr : jobPtr) is
      someJob: job := someJobPtr.all;
   begin
      Ada.Text_IO.Put_Line(Integer'Image(someJob.arg1) & ' ' & someJob.operator & Integer'Image(someJob.arg2) & " =" & Integer'Image(someJob.result));
   end printJob;

end job;
