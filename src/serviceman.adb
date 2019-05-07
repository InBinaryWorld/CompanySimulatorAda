with constants;
with Ada.Text_IO;
package body serviceman is

   task body serviceman is
      idx: Integer;
   begin
      loop
         servicePtr.all.pullToRepair(idx);
         delay constants.ServicemanWayTime;
         if idx > constants.AddMach then
            -- MultiMachine
            idx := idx - constants.AddMach;
            multiMachArr(idx).all.backdoor(1);
            if talkative then
               Ada.Text_IO.Put_Line("Multiplying Machine REPAIRED , id: " & idx'Image & " serviceman : " & id'Image);
            end if;
            delay 0.1;
            servicePtr.repairedMulti(idx);
         else
            -- AddMachine
            addMachArr(idx).all.backdoor(1);
            if talkative then
               Ada.Text_IO.Put_Line("Adding Machine REPAIRED , id: " & idx'Image & " serviceman : " & id'Image);
            end if;
            delay 0.1;
            servicePtr.repairedAdd(idx);
         end if;
      end loop;
   end serviceman;


   function initServiceman(Size : Integer; servicePtr : service.servicePtr; addMachArr : addingmachine.addMachArrAcc
                           ;multiMachArr : multimachine.multiMachArrAcc ; talkative : Boolean) return servicemanArrAcc is
     servicemanArr : servicemanArrAcc;
   begin
      servicemanArr := new servicemanArray(1 .. Size);
      for i in servicemanArr.all'Range loop
         servicemanArr.all(i):=new serviceman(i,servicePtr,addMachArr,multiMachArr, talkative);
      end loop;
      return servicemanArr;
   end initServiceman;

end serviceman;
