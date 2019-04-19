package constants is
   MaxJobs : CONSTANT Integer := 5;
   MaxResults : CONSTANT Integer := 5;


   Bosses : CONSTANT Positive := 1;
   Workers : CONSTANT Positive := 3;
   Clients : CONSTANT Positive := 1;
   AddMach : CONSTANT Positive := 3;
   MultiMach : CONSTANT Positive := 3;

   BossSpeed : CONSTANT Duration := 2.0;
   WorkerSpeed : CONSTANT Duration := 2.0;
   ClientSpeed : CONSTANT Duration := 1.0;
   AddMachSpeed : CONSTANT Duration := 1.0;
   MultiMachSpeed : CONSTANT Duration := 1.0;

   Unpatient : CONSTANT Duration := 1.0;
end constants;
