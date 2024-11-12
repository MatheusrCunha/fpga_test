-- Nome: Matheus Rodrigues da Cunha
-- Tarefa 08
-- Data: 03/11/24

#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom counter.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -radix binary /clk_t
add wave -radix binary /aclr_n_t
add wave -radix binary /count_out_t

#Simula até um 500ns
run 100ns

wave zoomfull
write wave wave.ps