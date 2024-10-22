-- Nome: Matheus Rodrigues da Cunha
-- Tarefa 01

#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom adder.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -label tb_dataa -radix dec  /tb_dataa
add wave -label tb_datab -radix dec  /tb_datab
add wave -label tb_sum  -radix dec  /tb_sum

#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps