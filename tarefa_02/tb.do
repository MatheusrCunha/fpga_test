-------------------------------------------------------
--! Tarefa 02: multiplicador de n-bits
--! Aluno: Matheus Rodrigues da Cunha
-------------------------------------------------------
#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom mult.vhd testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -voptargs="+acc" -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
add wave -label tb_dataa -radix unsigned  /tb_dataa
add wave -label tb_datab -radix unsigned  /tb_datab
add wave -label tb_product  -radix unsigned  /tb_product

#Simula até um 500ns
run 500ns

wave zoomfull
write wave wave.ps