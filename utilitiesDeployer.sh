# Script para desplegar la libreria compartida "Utilidades"

#
# Funciones
#


# Descargar biblioteca

descargar_biblioteca(){
	echo -n "Complete la direccion: https://transfer.sh/"
	read DIRECCION
	printf -v DIRECCION "https://transfer.sh/%s" $DIRECCION
	echo $DIRECCION
	curl $DIRECCION > libUtilidades.so
	printf -v LIBPATH "%s/libUtilidades.so" $PWD
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


# Opcion: descargar el ejecutable
echo "Desea descargar la biblioteca?"
select SN in "Si" "No"; do
    case $SN in
        Si ) descargar_biblioteca; break;;
        No ) break;;
    esac
done
echo "Desea actualizar la variable de entorno?"
select SN in "Si" "No"; do
    case $SN in
        Si ) actualizar_env; break;;
        No ) break;;
    esac
done

