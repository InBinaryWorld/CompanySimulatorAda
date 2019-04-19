with Ada.Numerics.discrete_Random;
package body random is

   subtype Rand_Range is Positive;
   package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);

   gen : Rand_Int.Generator;

   function get ( n: in Positive) return Integer is
   begin
      return Rand_Int.Random(gen) mod n;
   end get;

begin
   Rand_Int.Reset(gen);
end random;
