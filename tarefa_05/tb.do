-------------------------------------------------------
--! Tarefa 05: decoder 7 segmentos
--! Aluno: Matheus Rodrigues da Cunha
--! Data: 07/11/2024
-------------------------------------------------------
#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom seven_segment_cntrl.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -radix unsigned  /input_tb
add wave -radix binary  /segs_tb

#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps