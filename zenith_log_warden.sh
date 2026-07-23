#!/bin/bash

GLOW_GREEN='\033[1;92;42m'
GLOW_YELLOW='\033[1;93;43m'
TEXT_GREEN='\033[1;92m'
GLOW_RED='\033[1;91;41m'
TEXT_RED='\033[1;91m'
SUB_GRAY='\033[0;37m'
BRIGHT='\033[1;32m'
NC='\033[0m'

echo -e "${TEXT_GREEN}  ______________________________________________________"
echo -e " [======================================================]"
echo -e "  ||                                                  ||"
echo -e "  ||  ${BRIGHT}>> INITIALIZING: ALOKA_SYNDICATE_PROTOCOL${GREEN}       ||"
echo -e "  ||  ${BRIGHT}>> STATUS:       LOG_WARDEN_ACTIVE${GREEN}              ||"
echo -e "  ||                                                  ||"
echo -e "  ||  [|||||||||||||||||||||||||||||||| 100% SECURE]  ||"
echo -e "  ||                                                  ||"
echo -e " [======================================================]"
echo -e "  ------------------------------------------------------${NC}"

echo ""
echo ""

if [ ! -f "server_access.log" ]; then
	echo -e "${GLOW_RED} ERROR ${NC} ${TEXT_RED}File doesn't exist!${NC}"
	echo -e "${SUB_GRAY}by aloka syndicate security checker${NC}"
	exit 1

else grep -i "Failed" server_access.log | awk '{print "Date: " $1, " |  Time: " $2, " |  Target User: " $4, " |  Attacker_IP: " $5}' > suspicious_activity_report.log

fi

attempted_attacks=$(grep -c "Failed" server_access.log)

if (( "$attempted_attacks" > 5 )); then
	echo -e "${GLOW_RED}BRUTE FORCE ATTACK DETECTED!${NC} ${TEXT_RED}[${attempted_attacks} Failed attemps found!]${NC}"

else echo -e "${GLOW_GREEN}[SECURE] Log analysis complete. No active threats detected.${NC}"

fi
