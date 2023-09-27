//Verilog HDL for "barbaLib", "tests" "functional"


module tests ( );
	//wire trucStylax, wire2, wire3, wire4;
  
  inverter name1(.in(trucStylax), .out(wire2));
  memristor name2(.p(wire2), .n(trucStylax));
  res  R426 ( .MINUS(wire3), .PLUS(trucStylax));
  res  resi( .MINUS(wire2), .PLUS(wire4));
  //defparam R426.test = "15K";
  defparam R426.r = "8K";
  nch  M127 ( .D(wire3), .B(wire4), .G(wire2), .S(wire4));
endmodule
