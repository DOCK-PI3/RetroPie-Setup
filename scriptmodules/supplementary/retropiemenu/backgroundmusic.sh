#!/bin/bash

infobox= ""
infobox="${infobox}_______________________________________________________\n\n"
infobox="${infobox}\n"
infobox="${infobox}MasOS Background Music Script\n\n"
infobox="${infobox}The mpg123 background music script has already been installed on this base image.\n"
infobox="${infobox}\n"
infobox="${infobox}This script will play MP3 files during menu navigation in either Emulation Station or Attract mode.\n"
infobox="${infobox}\n"
infobox="${infobox}A special new folder has been created in the /roms directory called \"music\" for placing your MP3 files into.\n"
infobox="${infobox}\n"
infobox="${infobox}Once you place your music files into this folder, restart your system and the music will automatically begin playing.\n"
infobox="${infobox}\n"
infobox="${infobox}When you launch a game, however, the music will stop.  Upon exiting out of the game the music will begin playing again.\n"
infobox="${infobox}\n\n"
infobox="${infobox}**Disable**\nwhen you run the disable option, the /roms/music folder is renamed to /roms/music_disable\n"
infobox="${infobox}\n"
infobox="${infobox}**Enable**\nwhen you run the enable option, the /roms/music_disable folder is renamed to /roms/music\n"
infobox="${infobox}\n"

dialog --backtitle "MasOS Background Music" \
--title "MasOS Background Music" \
--msgbox "${infobox}" 35 110



function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "What action would you like to perform?" 25 75 20 \
            1 "Disable background music" \
            2 "Enable background music" \
            2>&1 > /dev/tty)

        case "$choice" in
            1) disable_music  ;;
            2) enable_music  ;;
            *)  break ;;
        esac
    done
}


function disable_music() {
dialog --infobox "Parando musica de fondo..." 3 20 ; sleep 2
disable_dir="/home/pi/MasOS/roms/music_disable"
enable_dir="/home/pi/MasOS/roms/music"

if [[ -d "$enable_dir" ]]; then
 mv /home/pi/MasOS/roms/music /home/pi/MasOS/roms/music_disable
fi

}

function enable_music() {
dialog --infobox "Activando musica de fondo..." 3 20 ; sleep 2
disable_dir="/home/pi/MasOS/roms/music_disable"
enable_dir="/home/pi/MasOS/roms/music"

if [[ -d "$disable_dir" ]]; then
 mv /home/pi/MasOS/roms/music_disable /home/pi/MasOS/roms/music
fi

}

main_menu
