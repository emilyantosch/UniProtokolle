vsim work.graytobinary
restart
view wave
radix bin
add wave -height 25 -radix default sim:/graytobinary/*

force clk 0,1 25ns -r 50ns

force g "0000"
run 100ns