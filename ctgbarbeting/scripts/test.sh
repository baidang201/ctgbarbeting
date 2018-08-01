#! //bin/bash

source ./setup.sh

echo "----- Jogo que tera ganhador unico" 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newgame '["Jogo1","Brazil","Germany",3,"1.0000 SYS", "10.0000 SYS",2018,07,30,0,0,"","Russia"]' -p bolao 

# echo "----- Jogo que tera 2 ganhadores"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newgame '["Jogo2","Brazil","France",5,"1.0000 SYS", "10.0000 SYS",2018,07,30,0,0,"","Russia"]' -p bolao 

# echo "----- Jogo que nao tera ganhadores"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newgame '["Jogo3","Brazil","Mexico",10,"1.0000 SYS", "10.0000 SYS",2018,07,30,0,0,"","Russia"]' -p bolao 

echo "----- listing games" 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table bolao bolao game

echo "----- show saldos"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player1 accounts
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player2 accounts
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player3 accounts

echo "----- bets"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player1 bolao "2.0000 SYS"  "0,2,1" -p player1
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player2 bolao "5.0000 SYS"  "0,1,1" -p player2
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player3 bolao "10.0000 SYS" "0,3,1" -p player3
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player1 bolao "10.0000 SYS"  "1,1,2" -p player1
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player2 bolao "7.0000 SYS"  "1,1,2" -p player2
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player3 bolao "5.0000 SYS" "1,2,1" -p player3
#cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player1 bolao "5.0000 SYS"  "2,1,2" -p player1
#cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player2 bolao "1.0000 SYS"  "2,1,2" -p player2
#cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} transfer player3 bolao "4.0000 SYS" "2,1,1" -p player3

# echo "----- bets"
# cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newbet '["player1", 0, 2, 1, "2.0000 SYS" ]' -p player1 
# cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newbet '["player2", 0, 1, 1, "5.0000 SYS" ]' -p player2 
# cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newbet '["player3", 0, 3, 1, "10.0000 SYS" ]' -p player3
# cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newbet '["player1", 1, 1, 2, "10.0000 SYS"]' -p player1 
# cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newbet '["player2", 1, 1, 2, "7.0000 SYS"]' -p player2 
# cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newbet '["player3", 1, 1, 1, "5.0000 SYS" ]' -p player3
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newbet '["player1", 2, 1, 2, "5.0000 SYS"]' -p player1 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newbet '["player2", 2, 1, 2, "1.0000 SYS"]' -p player2 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao newbet '["player3", 2, 1, 1, "4.0000 SYS"]' -p player3 

echo "----- show saldos"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player1 accounts
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player2 accounts
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player3 accounts

echo "----- listing bets" 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table bolao bolao bet


echo "----- Finalizing game with only one winner"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao finalize '[0, 2, 1 ]' -p bolao 

echo "----- Finalizing game with 2 winners"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao finalize '[1, 1, 2 ]' -p bolao 

echo "----- Finalizing game without winners"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao finalize '[2, 5, 5 ]' -p bolao 

echo "----- listing games" 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table bolao bolao game

echo "----- Show table player"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table bolao bolao player

echo "----- show saldos"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player1 accounts
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player2 accounts
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player3 accounts

echo "----- Claim tokens"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao claim '["player1"]' -p player1
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao claim '["player2"]' -p player2
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao claim '["player3"]' -p player3

echo "----- Show table player"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table bolao bolao player

echo "----- show saldos"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player1 accounts
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player2 accounts
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table eosio.token player3 accounts


echo "----- listing games" 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table bolao bolao game

echo "----- listing bets" 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table bolao bolao bet

echo "----- Releasing game ram"
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao relgameram '[0]' -p bolao 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} push action bolao relgameram '[2]' -p bolao 

echo "----- listing games" 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table bolao bolao game

echo "----- listing bets" 
cleos -u http://${NODE_EOS}:8800 --wallet-url http://${NODE_EOS}:${PORT} get table bolao bolao bet
