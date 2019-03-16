#!/usr/bin/env bash
rp_module_id="masosextrasall"
rp_module_desc="Actualizador para el sistema MasOS y utils"
rp_module_section=""
infobox="${infobox}\n_______________________________________________________\n\n"
infobox="${infobox}\nMasOS Herramientas extras para el menu ,actualizador de script base"
infobox="${infobox}\ny reparador de permisos para la version PC,IDIOMAS y mucho mas.."
infobox="${infobox}\n_______________________________________________________\n\n"
infobox="${infobox}\nIDIOMA español para emulationstation-dev CMake y Make auto ....new,"
infobox="${infobox}\neste script es para las instalaciones desde 0 ,funciona en rpi y pc \n"
infobox="${infobox}sin importar el nombre d usuario o sistema,solo tienen que tener instalado \n"
infobox="${infobox}emulationstation-dev ,lo pueden instalar en Administrar paquetes/Paquetes experimentales\n"
infobox="${infobox}Se recomienda instalacion de EXTRAS para el menu solo en raspberry pi....\n"
infobox="${infobox}\nEn PC puede instalar los extras si usa de nombre de usuario pi"

dialog --backtitle "MasOS extras y actualizador de script base" \
--title "MasOS EXTRAS ,actualizador y raparador de permisos en PC(by Mabedeep - The MasOS TEAM)" \
--msgbox "${infobox}" 35 110



function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "$BACKTITLE" --title " MAIN MENU " \
            --ok-label OK --cancel-label Exit \
            --menu "Que accion te gustaria realizar?" 25 75 20 \
            100 "-------------- Para RPI ----------------" \
			1 "RPI Actualizar MasOS-Setup script" \
			2 "RPI EXTRAS para el menu de ES" \
            3 "RPI ES instalar idioma español" \
			200 "-------------- Para PC ----------------" \
			4 "PC MasOS EXTRAS para el menu de ES" \
            5 "PC Reparar permisos en MasOS" \
            6 "PC ES-dev instalar idioma español Ubuntu 16.04.5" \
			7 "PC Actualizar MasOS-Setup script" \
			300  "------------- DEV BETAS -----------------" \
			8 "IDIOMA español emulationstation-dev instalaciones desde 0" \
			9 "EmulationStation iconos Originales" \
			10 "BETA EXTRAS PC RPI EmulationStation" \
			2>&1 > /dev/tty)

        case "$choice" in
			100) separador_menu  ;;
            1) masossetup_update  ;;
			2) masosmenu_extras  ;;
            3) pi_spanish ;;
			200) separador_menu  ;;
			4) masosmenu_extrasPC ;;
			5) permisos_pc  ;;
			6) pc_spanish  ;;
			7) masossetup_updatePC ;;
			300) separador_menu  ;;
			8) idioma_spanish_all ;;
			9) esicons_origi ;;
			10) extras_all_auto ;;
			*)  break ;;
        esac
    done
}

function separador_menu() {                                          #
dialog --infobox "... Separador para el menu, sin funcion ..." 30 55 ; sleep 3
}


#########################################################################
# funcion actualizacion para MasOS Setup script  ;-) #
function masossetup_update() {                                          #
dialog --infobox "...Actualizando RPI script MasOS-Setup..." 30 55 ; sleep 3
cd 
	sudo rm -R /home/pi/MasOS-Setup/
		sudo git clone --depth=1 https://github.com/DOCK-PI3/MasOS-Setup.git
	sudo chmod -R +x /home/pi/MasOS-Setup/
cd
sudo cp /home/pi/MasOS-Setup/scriptmodules/extras/gamelist.xml /opt/masos/configs/all/emulationstation/gamelists/retropie/
sudo cp /home/pi/MasOS-Setup/scriptmodules/extras/.livewire.py /home/pi/
sudo cp -R /home/pi/MasOS-Setup/scriptmodules/supplementary/retropiemenu/* /home/pi/RetroPie/retropiemenu/
sudo cp -R /home/pi/MasOS-Setup/scriptmodules/extras/scripts /home/pi/RetroPie/
sudo chmod -R +x /home/pi/RetroPie
sudo chmod -R +x /opt/
sudo mkdir /home/pi/MasOS/roms/music
sudo chown -R pi:pi /home/pi/MasOS
dialog --infobox "RPI MasOS-Setup script se actualizo correctamente!...\n\nEn 5seg se reinicia el sistema..espere por favor!" 60 75 ; sleep 5
sudo reboot 
}

#########################################################################
# funcion actualizacion para PC MasOS Setup script  ;-) #
function masossetup_updatePC() {                                          #
dialog --infobox "...Actualizando PC script MasOS-Setup..." 30 55 ; sleep 3
cd 
	sudo rm -R ~/MasOS-Setup/
		sudo git clone --depth=1 https://github.com/DOCK-PI3/MasOS-Setup.git
	sudo chmod -R +x ~/MasOS-Setup/
cd
sudo cp ~/MasOS-Setup/scriptmodules/extras/gamelist.xml /opt/masos/configs/all/emulationstation/gamelists/retropie/
sudo cp ~/MasOS-Setup/scriptmodules/extras/.livewire.py ~/
sudo cp -R ~/MasOS-Setup/scriptmodules/supplementary/retropiemenu/* ~/RetroPie/retropiemenu/
sudo cp -R ~/MasOS-Setup/scriptmodules/extras/scripts ~/RetroPie/
sudo chmod -R +x ~/RetroPie
sudo chmod -R +x /opt/
sudo mkdir ~/MasOS/roms/music
sudo chown -R $user:$user ~/MasOS
dialog --infobox " MasOS-Setup script se actualizo en su PC correctamente!...\n\nEn 5seg se reinicia el sistema..espere por favor!" 60 75 ; sleep 5
sudo reboot 
}

#########################################################################
# Funcion EXTRAs Menu ES para MasOS ;-) #
function masosmenu_extras() {                                          #
dialog --infobox " MasOS opciones Extras en rpi para el menu de ES..." 30 55 ; sleep 5
cd
sudo cp /home/pi/MasOS-Setup/scriptmodules/extras/gamelist.xml /opt/masos/configs/all/emulationstation/gamelists/retropie/
sudo cp /home/pi/MasOS-Setup/scriptmodules/extras/.livewire.py /home/pi/
sudo cp -R /home/pi/MasOS-Setup/scriptmodules/supplementary/retropiemenu/* /home/pi/RetroPie/retropiemenu/
# sudo cp -R /home/pi/MasOS-Setup/scriptmodules/supplementary/retropiemenu/icons /home/pi/RetroPie/retropiemenu
sudo cp -R /home/pi/MasOS-Setup/scriptmodules/extras/scripts /home/pi/RetroPie/
sudo chmod -R +x /home/pi/RetroPie
sudo chmod -R +x /opt/
sudo mkdir /home/pi/MasOS/roms/music
sudo chown -R pi:pi /home/pi/MasOS
dialog --infobox " Las opciones Extras estan instaladas,reiniciando el sistema en 5seg ..." 30 55 ; sleep 5
sudo reboot
# ---------------------------- #
}

#########################################################################
# Funcion PC EXTRAs Menu ES para MasOS ;-) #
function masosmenu_extrasPC() {                                          #
dialog --infobox " PC MasOS opciones Extras para el menu de ES..." 30 55 ; sleep 5
cd
sudo cp ~/MasOS-Setup/scriptmodules/extras/gamelist.xml /opt/masos/configs/all/emulationstation/gamelists/retropie/
sudo cp ~/MasOS-Setup/scriptmodules/extras/.livewire.py ~/
sudo cp -R ~/MasOS-Setup/scriptmodules/supplementary/retropiemenu/* ~/RetroPie/retropiemenu/
sudo cp -R ~/MasOS-Setup/scriptmodules/extras/scripts ~/RetroPie/
sudo chmod -R +x ~/RetroPie
sudo chmod -R +x /opt/
sudo mkdir ~/MasOS/roms/music
sudo chown -R $user:$user ~/MasOS
dialog --infobox " Las opciones Extras estan instaladas,reiniciando el sistema en 5seg ..." 30 55 ; sleep 5
sudo reboot
# ---------------------------- #
}

#########################################################################
# Funcion Reparar permisos en MasOS PC ;-) #
function permisos_pc() {                                          #
dialog --infobox " Repara los permisos en el directorio themes y overlays para que puedan ser editados los ficheros...\n\n" 30 55 ; sleep 5
cd
sudo chown -R $user:$user /etc/emulationstation/themes/
sudo chown -R $user:$user /opt/masos/configs/
dialog --infobox " Los permisos fueron reparados ..." 30 55 ; sleep 5
# ---------------------------- #
}

#########################################################################
# Raspberry pi instalar idioma español en ES #
function pi_spanish() {                                          #
dialog --infobox " Raspberry pi - instalar idioma español en ES..." 30 55 ; sleep 5
cd
sudo killall emulationstation
sudo cp -R /home/pi/MasOS-Setup/scriptmodules/extras/es_idioma/locale/ /opt/masos/supplementary/emulationstation/
sudo cp -R /home/pi/MasOS-Setup/scriptmodules/extras/es_idioma/resources/ /opt/masos/supplementary/emulationstation/
sudo cp -R /home/pi/MasOS-Setup/scriptmodules/extras/es_idioma/* /opt/masos/supplementary/emulationstation/
dialog --infobox " El idioma se instalo correctamente ,reiniciando el sistema en 5seg ..." 30 55 ; sleep 5
sudo reboot
# ---------------------------- #
}

#########################################################################
# PC instalar idioma español en ES #
function pc_spanish() {                                          #
dialog --infobox " PC Ubuntu 16.04.5 - instalar idioma español en ES..." 30 55 ; sleep 5
cd
sudo killall emulationstation
sudo cp -R ~/MasOS-Setup/scriptmodules/extras/es_idiomaPC/locale/ /opt/masos/supplementary/emulationstation/
sudo cp -R ~/MasOS-Setup/scriptmodules/extras/es_idiomaPC/resources/ /opt/masos/supplementary/emulationstation/
sudo cp ~/MasOS-Setup/scriptmodules/extras/es_idiomaPC/* /opt/masos/supplementary/emulationstation/
dialog --infobox " El idioma se instalo correctamente ,reiniciando el sistema en 5seg ..." 30 55 ; sleep 5
sudo reboot
# ---------------------------- #
}
                                                                                                                     #
######################################################################################################################
# Instalar idioma español en ES-dev all system - CMake y Make # Dependencias emulationstation-dev y libboost-all-dev#
function idioma_spanish_all() {                                          #############################################
dialog --infobox " CMAKE Y MAKE instalar idioma español en emulationstation-dev. Recuerde ejecutar el script desde consola y con emulationstation inactivo.." 30 55 ; sleep 5
cd && git clone --recursive https://github.com/DOCK-PI3/EmulationStation.git
cd EmulationStation && mkdir src && cd src
cmake .. && make
sudo cp -R ~/EmulationStation/locale/ /opt/masos/supplementary/emulationstation-dev/
sudo cp -R ~/EmulationStation/resources/ /opt/masos/supplementary/emulationstation-dev/
sudo cp ~/EmulationStation/emulationstation /opt/masos/supplementary/emulationstation-dev/
sudo rm -R ~/EmulationStation
sudo chown -R $user:$user /opt/masos/supplementary/emulationstation-dev/
dialog --infobox " El idioma se instalo correctamente ,reiniciando el sistema en 5seg ..." 30 55 ; sleep 5
sudo reboot
# ---------------------------- #
}

#########################################################################
# instalar ES icons origi #
function esicons_origi() {                                          #
dialog --infobox "... instalar ES icons originales ..." 30 55 ; sleep 5
cd && mkdir temporal
cd temporal && git clone https://github.com/DOCK-PI3/es-iconsthemes-ORIGINAL.git
sudo cp -R ~/temporal/es-iconsthemes-ORIGINAL/*.svg /opt/masos/supplementary/emulationstation/resources/help/
sudo cp -R ~/temporal/es-iconsthemes-ORIGINAL/*.svg /opt/masos/supplementary/emulationstation-dev/resources/help/
sudo chown -R $user:$user /opt/masos/supplementary/emulationstation/
sudo chown -R $user:$user /opt/masos/supplementary/emulationstation-dev/
sudo rm -R ~/temporal
dialog --infobox "... Iconos originales instalados ,reinicie ES para ver los nuevos iconos..." 30 55 ; sleep 5
# ---------------------------- #
}

#########################################################################
# Instalador de extras segun el sistema ,para PC y RPI #
function extras_all_auto() {

        if [[ -f /home/pi/RetroPie/retropiemenu/raspiconfig.rp ]]; then
			cd
			sudo cp /home/pi/MasOS-Setup/scriptmodules/extras/gamelist.xml /opt/masos/configs/all/emulationstation/gamelists/retropie/
			sudo cp /home/pi/MasOS-Setup/scriptmodules/extras/.livewire.py /home/pi/
			sudo cp -R /home/pi/MasOS-Setup/scriptmodules/supplementary/retropiemenu/* /home/pi/RetroPie/retropiemenu/
			sudo cp -R /home/pi/MasOS-Setup/scriptmodules/extras/scripts /home/pi/RetroPie/
			sudo chmod -R +x /home/pi/RetroPie
			sudo chmod -R +x /opt/
			sudo mkdir /home/pi/MasOS/roms/music
			sudo chown -R pi:pi /home/pi/MasOS
    else
        if [[ -f $home/.config/autostart/masos.desktop ]]; then
		cd
		sudo cp ~/MasOS-Setup/scriptmodules/extras/gamelist.xml /opt/masos/configs/all/emulationstation/gamelists/retropie/
		sudo cp ~/MasOS-Setup/scriptmodules/extras/.livewire.py ~/
		sudo cp -R ~/MasOS-Setup/scriptmodules/supplementary/retropiemenu/* ~/RetroPie/retropiemenu/
		sudo cp -R ~/MasOS-Setup/scriptmodules/extras/scripts ~/RetroPie/
		sudo chmod -R +x ~/RetroPie
		sudo chmod -R +x /opt/
		sudo mkdir ~/MasOS/roms/music
		sudo chown -R $user:$user ~/MasOS
	fi
		fi
# ---------------------------- #
}

main_menu

