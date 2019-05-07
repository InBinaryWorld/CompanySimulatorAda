package job  is
   type String is array (Positive range <>) of Character;
   type job is record
      arg1 : Integer;
      arg2 : Integer;
      operator : Character;
      result : Integer;
      isDone : Boolean :=false;
   end record;
   type jobPtr is access all job;
   procedure printJob(someJobPtr : jobPtr);
   procedure printJobWithoutResult(someJobPtr : jobPtr);
end job;
