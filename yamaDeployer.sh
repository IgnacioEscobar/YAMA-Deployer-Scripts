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
	FILENAME="YAMA"
	FILEID="1KDB674igKeZqgASz6e-QJZfnPQl5Mhmt"
	curl -L -o ${FILENAME} "https://drive.google.com/uc?export=download&id=${FILEID}"
}

# Escribir el archivo de configuracion
generar_configuracion(){
	echo "Ingrese la ip del FS"
	echo -n "> "
	read IPFS
	echo "Ingrese el puerto del FS"
	echo -n "> "
	read PUERTOFS
	echo "Ingrese el retardo de planificacion"
	echo -n "> "
	read 
	echo "Que algoritmo de planificacion desea utilizar?"
	select CWC in "Clock" "Weighted Clock"; do
	    case $CWC in
	        Si ) ALG = "WCLOCK"; break;;
	        No ) ALG = "CLOCK"; break;;
	    esac
	done
	echo "Ingrese el puerto del YAMA"
	echo -n "> "
	read PUERTOYAMA
	
	echo "FS_IP=$IPFS" > yama-config.cfg
	echo "FS_PUERTO=$PUERTOFS" >> yama-config.cfg
	echo "ALGORITMO_BALANCEO=$ALG" >> yama-config.cfg
	echo "YAMA_PUERTO=$PUERTOYAMA" >> yama-config.cfg
}

#
# Script principal
#

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


# Otorgarle permisos
chmod +x $FILENAME