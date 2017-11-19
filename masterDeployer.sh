#
# Script principal
#
clear
echo "     __             __                        "
echo " .--|  .-----.-----|  .-----.--.--.-----.----."
echo " |  _  |  -__|  _  |  |  _  |  |  |  -__|   _|"
echo " |_____|_____|   __|__|_____|___  |_____|__|  "
echo "             |__|           |_____|           "
echo "               Desplegando master"
echo " "

# Descargar biblioteca

descargar_ejecutable(){
	FILENAME="Master"
	FILEID="1KDB674igKeZqgASz6e-QJZfnPQl5Mhmt"
	curl -L -o ${FILENAME} "https://drive.google.com/uc?export=download&id=${FILEID}"
}

# Escribir el archivo de configuracion
generar_configuracion(){
	echo "Ingrese la ip del YAMA"
	echo -n "> "
	read IPYAMA 
	echo "Ingrese el puerto del YAMA"
	echo -n "> "
	read PUERTOYAMA
	
	echo "YAMA_IP=$IPYAMA" > master-config.cfg
	echo "YAMA_PUERTO=$PUERTOYAMA" >> master-config.cfg
}

# Opcion: descargar el ejecutable
echo "Desea descargar el ejecutable?"
select SN in "Si" "No"; do
    case $SN in
        Si ) descargar_ejecutable; break;;
        No ) break;;
    esac
done

# Opcion: generar el archivo de configuracion
echo "Desea generar el archivo de configuracion?"
select SN in "Si" "No"; do
    case $SN in
        Si ) generar_configuracion; break;;
        No ) break;;
    esac
done