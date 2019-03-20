with jobtable;
package boss is

   task type boss(id : Integer ; talkative : Boolean; JobTabPtr : jobtable.jobTabPtr);
   type bossArray is array (Positive range <>) of access boss;
   type bossArrAccess is access bossArray;
   function initBosses(Size : Integer; talkative : Boolean; JobTabPtr : jobtable.jobTabPtr ) return bossArrAccess;

end boss;
