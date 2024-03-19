synthesize:
	yosys -D LEDS_NR=3 -p "read_verilog blinky.v; synth_gowin -json blinky.json"
	nextpnr-gowin --json blinky.json --write pnrblinky.json --device GW1NZ-LV1QN48C6/I5 --cst tangnano1k.cst
	gowin_pack -d GW1NZ-1 -o pack.fs pnrblinky.json
flash:
	openFPGALoader -v -b tangnano1k pack.fs

clean:
	rm -f *.fs *.json
