#/bin/bash

# @name:	Ejercicio 6 Práctica final
# @desc: 	Papelera temporal / modificacion del comando rm
# @reqs:	Necesario tener './' añadido al PATH
# @author: 	Jose Luis Jimenez Urbano <@iJos>
# @date:	18/05/2014

clear

#Checkeamos si el user es root o no
if [ "$(id -u)" != "0" ]; then
	echo "Necesitas ejecutar el script como root..."
	sleep 2
	echo "...saliendo..."
	sleep 2
	exit
fi

user_actual="$HOME"
#Creamos el fichero de usuarios
if [ ! -d "$user_actual/papelera_tmp/" ]; then
	echo "***** Configuración del script *****"
	echo
	echo "El directorio "$user_actual/papelera_tmp/" no existe, creando..."
	sleep 3
	mkdir "$user_actual/papelera_tmp/"
	echo 	
	echo "Creado con éxito"
	sleep 3
	clear
fi

#Script listo
echo "*************** Ejercicio 6 ***************"
echo "*        Modificacion del comando rm      *"
echo "*******************************************"
echo


accion_script="$1"


#OPCION -e
#Esta opcion es para eliminar ficheros o directorios

if [ "$accion_script" = "-e" ]; then

	elemento_eliminar="$2"
	mv "$elemento_eliminar" "$user_actual"/papelera_tmp/
	echo "$elemento_eliminar enviado a la papelera ($user_actual/papelera_tmp/)"

elif [ "$accion_script" = "-l" ]; then

	#Listar papelera
	ls -l "$user_actual"/papelera_tmp/

elif [ "$accion_script" = "-r" ]; then

	#Recuperar fichero de la papelera
	elemento_recuperar="$2"
	directorio_final="$3"
	mv "$elemento_recuperar" "$directorio_final"
	echo "Recuperado $elemento_recuperar al directorio $directorio_final"
elif [ "$accion_script" = "-h" ]; then
	echo "****************** Ayuda ******************"
	echo "Ejercicio6.sh [-e] 'elemento a eliminar' > Elimina (a la papelera) el elemento pasado por parámetro"
	echo "Ejercicio6.sh [-l] > Lista los elementos que hay en la papelera"
	echo "Ejercicio6.sh [-r] 'elemento de la papelera a recuperar' 'directorio donde se deja el elemento' > Pone el elemento de la papelera en el directorio pasado como segundo parametro"
	echo "Ejercicio6.sh [-h] > Muestra la ayuda"
	echo "*******************************************"
else
	
	echo "*********** Parametro no válido ***********"
	echo "****************** Ayuda ******************"
	echo "Ejercicio6.sh [-e] 'elemento a eliminar' > Elimina (a la papelera) el elemento pasado por parámetro"
	echo "Ejercicio6.sh [-l] > Lista los elementos que hay en la papelera"
	echo "Ejercicio6.sh [-r] 'elemento de la papelera a recuperar' 'directorio donde se deja el elemento' > Pone el elemento de la papelera en el directorio pasado como segundo parametro"
	echo "Ejercicio6.sh [-h] > Muestra la ayuda"
	echo "*******************************************"

fi
