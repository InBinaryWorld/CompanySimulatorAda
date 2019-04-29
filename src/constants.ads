package constants is
   MaxJobs : CONSTANT Integer := 5;
   MaxResults : CONSTANT Integer := 5;


   Bosses : CONSTANT Positive := 1;
   Workers : CONSTANT Positive := 4;
   Clients : CONSTANT Positive := 1;
   AddMach : CONSTANT Positive := 3;
   MultiMach : CONSTANT Positive := 3;

   BossSpeed : CONSTANT Duration := 0.12;
   WorkerSpeed : CONSTANT Duration := 0.05;
   ClientSpeed : CONSTANT Duration := 0.00001;
   AddMachSpeed : CONSTANT Duration := 0.4;
   MultiMachSpeed : CONSTANT Duration := 0.4;

   Unpatient : CONSTANT Duration := 0.05;
end constants;
