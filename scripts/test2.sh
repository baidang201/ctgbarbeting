#! //bin/bash

source ./setup.sh

# echo "----- Jogo que nao tera ganhadores"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newgame '["Jogo3","Brazil","Mexico",10,"1.0000 SYS", "10.0000 SYS",2018,07,30,0,0,"","Russia"]' -p bolao 

echo "----- bets"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player1 bolao "2.0000 SYS"  "0,2,1" -p player1
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player2 bolao "5.0000 SYS"  "0,1,1" -p player2
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player3 bolao "10.0000 SYS" "0,3,1" -p player3

echo "----- Finalizing game without winners"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao finalize '[0, 5, 5 ]' -p bolao 

echo "----- listing games" 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table bolao bolao game

echo "----- Show table player"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table bolao bolao player

