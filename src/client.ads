
with warehouse;
package client is

   task type client(id : Integer ; talkative : Boolean; warePtr : warehouse.whPtr);
   type clientArray is array (Positive range <>) of access client;
   type clientArrAccess is access clientArray;
   function initClients (Size : Integer; talkative : Boolean; warePtr : warehouse.whPtr )return clientArrAccess;
end client;
