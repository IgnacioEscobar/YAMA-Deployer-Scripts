# Script para desplegar la libreria compartida "Utilidades"

#
# Funciones
#


# Descargar biblioteca

descargar_biblioteca(){
	FILENAME="libUtilidades.so"
	FILEID="1DepNfoZxJTUnW023qfNblPhVX3rUn_7U"
	curl -L -o ${FILENAME} "https://drive.google.com/uc?export=download&id=${FILEID}"
}

# Agregar al LD_LIBRARY_PATH
actualizar_env(){
	printf -v NEWPATH "%s:%s" $LD_LIBRARY_PATH $LIBPATH
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
echo "             Desplegando utilidades"
echo " "


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

