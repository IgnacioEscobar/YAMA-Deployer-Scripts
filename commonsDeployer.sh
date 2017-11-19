# Script para desplegar la libreria compartida "Utilidades"

#
# Funciones
#


# Descargar biblioteca

descargar_biblioteca(){
	FILENAME="libcommons.so"
	FILEID="1FTaHAgADNriYt9toilZxSTL8pOoKIBdY"
	curl -L -o ${FILENAME} "https://drive.google.com/uc?export=download&id=${FILEID}"
}

# Agregar al LD_LIBRARY_PATH
actualizar_env(){
	NEWPATH="${LD_LIBRARY_PATH}:${PWD}"
	export LD_LIBRARY_PATH=$NEWPATH
}



#
# Script principal
#

clear
echo "     __             __                        "
echo " .--|  .-----.-----|  .-----.--.--.-----.----."
echo " |  _  |  -__|  _  |  |  _  |  |  |  -__|   _|"
echo " |_____|_____|   __|__|_____|___  |_____|__|  "
echo "             |__|           |_____|           "
echo "               Desplegando commons"
echo " "

printf "\e[32mIMPORTANTE!! Correr script en modo <source>\e[0m\n\n"


# Opcion: descargar la biblioteca
echo "Desea descargar la biblioteca?"
select SN in "Si" "No"; do
    case $SN in
        Si ) descargar_biblioteca; break;;
        No ) break;;
    esac
done
# Opcion: actualizar variable de entorno
echo "Desea actualizar la variable de entorno?"
select SN in "Si" "No"; do
    case $SN in
        Si ) actualizar_env; break;;
        No ) break;;
    esac
done

