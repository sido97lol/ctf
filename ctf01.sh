#!/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Banner
echo -e "${CYAN}"
cat << "EOF"
 ██████╗████████╗███████╗ █████╗ ███╗   ███╗
██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
██║        ██║   █████╗  ███████║██╔████╔██║
██║        ██║   ██╔══╝  ██╔══██║██║╚██╔╝██║
╚██████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
 ╚═════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
     ░▒▓█ @Djayso █▓▒░
EOF
echo -e "${NC}"

# Create user max with home directory
useradd -m max

# Set password for max
echo "max:tDOXIF" | chpasswd

# Mission and flag in max's home
echo "FLAG{this_is_the_first_flag}" > /home/max/flag.txt
echo "You have now to delete Max from the groups he belongs to and delete the user with all files he created from before." > /home/max/mission.txt
chown max:max /home/max/flag.txt /home/max/mission.txt
chmod 600 /home/max/flag.txt /home/max/mission.txt
chmod 700 /home/max

# Add max to some groups
usermod -aG sudo max
usermod -aG adm max
usermod -aG audio max
groupadd hackers 2>/dev/null
usermod -aG hackers max

# Create fake .flag files
echo "You won't find me" > /var/tmp/max_credentials.flag
echo "Wrong choice" > /etc/max_was_here.flag

# Puzzle 1: Reversed file content
mkdir -p /opt/mindgames
echo "!galf laer eht ton si sihT" > /opt/mindgames/reversed.flag

# Puzzle 2: Base64 encoded hint
echo "VGhlIGNyZWRzIGFyZSBpbiAvdmFyL2xvZ3MvYXJjaGl2ZS9ibGFjay5mbGFn" > /opt/mindgames/base64_clue.txt

# Puzzle 3: Hidden file in max’s home
echo "You found the hidden dotfile!" > /home/max/.secret_note
chown max:max /home/max/.secret_note
chmod 600 /home/max/.secret_note

# Puzzle 4: Real credentials in black.flag
mkdir -p /var/logs/archive
echo "max:tDOXIF" > /var/logs/archive/black.flag

# Trap: Fake flag
echo "FLAG{fake_flag_123}" > /srv/fake.flag

# Set permissions
chmod 444 /var/tmp/max_credentials.flag
chmod 444 /etc/max_was_here.flag
chmod 444 /opt/mindgames/* /var/logs/archive/black.flag /srv/fake.flag

# Final structured output
echo -e "${GREEN}✅ Mission setup complete.${NC}"
echo -e ""
echo -e "${YELLOW}📜 Rules:${NC}"
echo -e " - ${RED}Do NOT use root privileges${NC}"
echo -e " - Explore the system using regular user permissions"
echo -e ""
echo -e "${BLUE}👤 User Created:${NC} ${CYAN}max${NC}"
echo -e " - Home directory: ${CYAN}/home/max${NC}"
echo -e ""
echo -e "${YELLOW}🧩 Puzzles to Solve:${NC}"
echo -e " 1. 🔍 Find all ${CYAN}.flag${NC} files — not all are real!"
echo -e " 2. 🕵️  Decode the base64 clue at ${CYAN}/opt/mindgames/base64_clue.txt${NC}"
echo -e " 3. 🔁 Read and reverse text in ${CYAN}/opt/mindgames/reversed.flag${NC}"
echo -e " 4. 🫣 Discover the hidden dotfile in ${CYAN}/home/max${NC}"
echo -e " 5. 🔑 Use the password hidden in a file to ${CYAN}su max${NC} and explore his home"
echo -e ""
echo -e "${GREEN}🚀 Your mission:${NC}"
echo -e " - Figure out what ${CYAN}max${NC} did to the system"
echo -e " - Remove him from all groups"
echo -e " - Delete the user ${CYAN}max${NC} and all files he ever created"
echo -e ""
echo -e "${RED}Good luck, agent.${NC} 🕶️"
