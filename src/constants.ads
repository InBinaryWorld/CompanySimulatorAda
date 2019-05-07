package constants is
   MaxJobs : CONSTANT Integer := 5;
   MaxResults : CONSTANT Integer := 5;


   Bosses : CONSTANT Positive := 2;
   Workers : CONSTANT Positive := 3;
   Clients : CONSTANT Positive := 1;
   AddMach : CONSTANT Positive := 2;
   MultiMach : CONSTANT Positive := 2;
   Servisants : CONSTANT Positive := 3;

   BossSpeed : CONSTANT Duration := 5.0;
   WorkerSpeed : CONSTANT Duration := 1.0;
   ClientSpeed : CONSTANT Duration := 2.2;
   AddMachSpeed : CONSTANT Duration := 7.0;
   MultiMachSpeed : CONSTANT Duration := 7.0;
   ServicemanWayTime : CONSTANT Duration := 7.0;
   ChangeMachineTime : CONSTANT Duration := 0.8;

   Unpatient : CONSTANT Duration := 0.005;
   PropOfMachDamage :CONSTANT Integer := 40; --in  %
end constants;
