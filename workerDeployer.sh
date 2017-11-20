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
	FILENAME="Worker"
	FILEID="1KDB674igKeZqgASz6e-QJZfnPQl5Mhmt"
	curl -L -o ${FILENAME} "https://drive.google.com/uc?export=download&id=${FILEID}"
}

# Generar carpetas
generar_carpetas(){
	mkdir scripts
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

# Opcion: generar carpetas
echo "Desea generar la estructura de carpetas?"
select SN in "Si" "No"; do
    case $SN in
        Si ) generar_carpetas; break;;
        No ) break;;
    esac
done


# Otorgarle permisos

chmod +x $FILENAME