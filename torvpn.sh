#!/bin/bash
#
# TORVPN: (14/12/2020)
#
# Variables y Colores
#
OS=$(uname -o)
verde='\033[32m'
blanco='\033[37m'
rojo='\033[31m'
azul='\033[34m'
negro='\033[0;30m'
rosa='\033[38;5;207m'
amarillo='\033[33m'
morado='\033[35m'
cian='\033[1;36m'
magenta='\033[1;35m'
#
# Dependencias del Script
#
function Dependencies {
if [ "${OS}" == "Android" ]; then
	if [ -x ${PREFIX}/bin/tor ]; then
		RUTA=$(pwd)
	else
		RUTA=$(pwd)
echo -e "${verde}
┌═══════════════════┐
█ ${blanco}INSTALANDO TOR... ${verde}█
└═══════════════════┘"${blanco}
		pkg install tor -y > /dev/null 2>&1
	fi
	if [ -x ${PREFIX}/bin/torsocks ]; then
		RUTA=$(pwd)
	else
		RUTA=$(pwd)
echo -e "${verde}
┌════════════════════════┐
█ ${blanco}INSTALANDO TORSOCKS... ${verde}█
└════════════════════════┘"${blanco}
		pkg install torsocks -y > /dev/null 2>&1
	fi
	if [ -x ${PREFIX}/bin/proxychains4 ]; then
		RUTA=$(pwd)
	else
		RUTA=$(pwd)
echo -e "${verde}
┌══════════════════════════════┐
█ ${blanco}INSTALANDO PROXYCHAINS-NG... ${verde}█
└══════════════════════════════┘"${blanco}
		pkg install proxychains-ng -y > /dev/null 2>&1
	fi
	if [ -x ${PREFIX}/bin/w3m ]; then
		RUTA=$(pwd)
	else
		RUTA=$(pwd)
echo -e "${verde}
┌═══════════════════┐
█ ${blanco}INSTALANDO W3M... ${verde}█
└═══════════════════┘"${blanco}
		pkg install w3m -y > /dev/null 2>&1
	fi
else
echo -e "${rojo}
┌═══════════════════════┐
█ ${blanco}POR FAVOR USAR TERMUX ${rojo}█
└═══════════════════════┘
"${blanco}
exit
fi
}
#
# Mensaje Para Omitir Instalación
#
function Exists {
echo -e "${verde}
┌════════════════════════┐
█ ${blanco}¡EL COMANDO YA EXISTE! ${verde}█
└════════════════════════┘
"${blanco}
sleep 0.5
}
#
# Mensaje Para Capturar Errores
#
function Error {
echo -e "${rojo}
┌═════════════════════┐
█ ${blanco}¡OPCIÓN INCORRECTA! ${rojo}█
└═════════════════════┘
"${blanco}
sleep 0.5
}
#
# Mensaje Para Mostrar Finalización de Instalación
#
function Finished {
echo -e "${verde}
┌════════════════════════┐
█ ${blanco}INSTALACIÓN FINALIZADA ${verde}█
└════════════════════════┘
"${blanco}
}
#
# Instalación de Comandos
#
function CommandTORVPN {
if [ -x ${PREFIX}/bin/TORVPN ]; then
Exists
Commands
else
echo -e "${verde}
┌══════════════════════════════┐
█ ${blanco}INSTALANDO COMANDO TORVPN... ${verde}█
└══════════════════════════════┘
"${blanco}
cp ${RUTA}/TORVPN ${PREFIX}/bin
chmod 777 ${PREFIX}/bin/TORVPN
sleep 1
Finished
fi
}
function CommandShowIP {
if [ -x ${PREFIX}/bin/ShowIP ]; then
Exists
Commands
else
echo -e "${verde}
┌══════════════════════════════┐
█ ${blanco}INSTALANDO COMANDO ShowIP... ${verde}█
└══════════════════════════════┘
"${blanco}
cp ${RUTA}/ShowIP ${PREFIX}/bin
chmod 777 ${PREFIX}/bin/ShowIP
sleep 1
Finished
fi
}
function CommandProxyIP {
if [ -x ${PREFIX}/bin/ProxyIP ]; then
Exists
Commands
else
echo -e "${verde}
┌═══════════════════════════════┐
█ ${blanco}INSTALANDO COMANDO ProxyIP... ${verde}█
└═══════════════════════════════┘
"${blanco}
cp ${RUTA}/ProxyIP ${PREFIX}/bin
chmod 777 ${PREFIX}/bin/ProxyIP
sleep 1
Finished
fi
}
function CommandChangeIP {
if [ -x ${PREFIX}/bin/ChangeIP ]; then
Exists
Commands
else
echo -e "${verde}
┌════════════════════════════════┐
█ ${blanco}INSTALANDO COMANDO ChangeIP... ${verde}█
└════════════════════════════════┘
"${blanco}
cp ${RUTA}/ChangeIP ${PREFIX}/bin
chmod 777 ${PREFIX}/bin/ChangeIP
sleep 1
Finished
fi
}
#
# Banner TORVPN
#
function TORVPN {
	sleep 0.5
	clear
echo -e "${morado}
${morado}████████╗ ██████╗ ██████╗   ${verde}██╗   ██╗██████╗ ███╗   ██╗
${morado}╚══██╔══╝██╔═══██╗██╔══██╗  ${verde}██║   ██║██╔══██╗████╗  ██║
${morado}   ██║   ██║   ██║██████╔╝  ${verde}██║   ██║██████╔╝██╔██╗ ██║
${morado}   ██║   ██║   ██║██╔══██╗  ${verde}╚██╗ ██╔╝██╔═══╝ ██║╚██╗██║
${morado}   ██║   ╚██████╔╝██║  ██║  ${verde} ╚████╔╝ ██║     ██║ ╚████║
${morado}   ╚═╝    ╚═════╝ ╚═╝  ╚═╝  ${verde}  ╚═══╝  ╚═╝     ╚═╝  ╚═══╝"${blanco}
}
#
# Seleccionando Comandos a Instalar
#
function Commands {
	TORVPN
echo -e -n "${verde}
┌═══════════════════════════════┐
█ ${blanco}¿QUÉ COMANDOS DESEA INSTALAR? ${verde}█
└═══════════════════════════════┘
┃    ┌═════════════════════════════════════════════┐
└═>>>█ [${blanco}01${verde}] ┃ ${morado}TORVPN ${verde}┃ ${morado}ShowIP ${verde}┃ ${morado}ProxyIP ${verde}┃ ${morado}ChangeIP ${verde}█
┃    └═════════════════════════════════════════════┘
┃    ┃    ┌═══════════════════════════════════════════┐
┃    └═>>>█ ${blanco}INSTALAR TODOS LOS COMANDOS DE LA RED TOR ${verde}█
┃         └═══════════════════════════════════════════┘
┃    ┌═══════════════┐
└═>>>█ [${blanco}02${verde}] ┃ ${morado}TORVPN ${verde}█
┃    └═══════════════┘
┃    ┃    ┌═════════════════════════════════════════┐
┃    └═>>>█ ${blanco}CONECTA A LA RED TOR ${morado}(THE ONION ROUTER) ${verde}█
┃         └═════════════════════════════════════════┘
┃    ┌═══════════════┐
└═>>>█ [${blanco}03${verde}] ┃ ${morado}ShowIP ${verde}█
┃    └═══════════════┘
┃    ┃    ┌═══════════════════════════════════┐
┃    └═>>>█ ${blanco}MUESTRA LA IP ASIGNADA POR EL ISP ${verde}█
┃         └═══════════════════════════════════┘
┃    ┌════════════════┐
└═>>>█ [${blanco}04${verde}] ┃ ${morado}ProxyIP ${verde}█
┃    └════════════════┘
┃    ┃    ┌═════════════════════════════════════┐
┃    └═>>>█ ${blanco}MUESTRA LA IP ASIGNADA POR EL PROXY ${verde}█
┃         └═════════════════════════════════════┘
┃    ┌═════════════════┐
└═>>>█ [${blanco}05${verde}] ┃ ${morado}ChangeIP ${verde}█
┃    └═════════════════┘
┃    ┃    ┌════════════════════════════════════┐
┃    └═>>>█ ${blanco}CAMBIA LA IP ASIGNADA POR EL PROXY ${verde}█
┃         └════════════════════════════════════┘
┃    ┌════════════════┐
└═>>>█ [${blanco}00${verde}] ┃ ${rojo}NINGUNO ${verde}█
┃    └════════════════┘
┃
└═>>> "${blanco}
read -r COMMAND
if [[ ${COMMAND} == 0 || ${COMMAND} == 00 ]]; then
exit
elif [[ ${COMMAND} == 1 || ${COMMAND} == 01 ]]; then
CommandTORVPN
CommandShowIP
CommandProxyIP
CommandChangeIP
elif [[ ${COMMAND} == 2 || ${COMMAND} == 02 ]]; then
CommandTORVPN
elif [[ ${COMMAND} == 3 || ${COMMAND} == 03 ]]; then
CommandShowIP
elif [[ ${COMMAND} == 4 || ${COMMAND} == 04 ]]; then
CommandProxyIP
elif [[ ${COMMAND} == 5 || ${COMMAND} == 05 ]]; then
CommandChangeIP
else
Error
Commands
fi
}
#
# Declarando Funciones
#
Dependencies
Commands
