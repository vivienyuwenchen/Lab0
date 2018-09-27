run: adder
	./adder
adder: adder.v adder.t.v
	iverilog -o adder adder.t.v