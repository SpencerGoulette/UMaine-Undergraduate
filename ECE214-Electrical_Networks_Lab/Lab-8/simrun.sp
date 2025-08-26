***** Spice Netlist for Cell 'Lab8Pre' *****

************** Module Lab8Pre **************
r0 n1 n0 1k noisy=0
r1 vout n0 1k noisy=0
r2 vc2 n0 60k noisy=0
r3 vc1 n0 60k noisy=0
r4 gnd vc1 30k noisy=0
r5 gnd vc2 30k noisy=0
x1 vout vc2 gnd 2n7000_mod 
c1 n1 vc2 0.1uf ic=0
c0 vc1 vout 0.1uf ic=0
vsup n0 gnd dc='12' ac='1' 
x0 n1 vc1 gnd 2n7000_mod 





.include '../../../SpiceModels/ECE214_models.mod'
.temp 27
.tran 1u 100m 0m
.global gnd
.param freq=40000
.options post=1 delmax=5p relv=1e-6 reli=1e-6 relmos=1e-6 method=gear
.op
.IC V(Vc1) = 0

.end

