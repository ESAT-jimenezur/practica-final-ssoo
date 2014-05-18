#/bin/bash

# @name:	Ejercicio 5 Práctica final
# @desc: 	Screenshot de un directorio pasado como parametro
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
if [ ! -d "$user_actual/screenshots/" ]; then
	echo "***** Configuración del script *****"
	echo
	echo "El directorio "$user_actual/screenshots/" no existe, creando..."
	sleep 3
	mkdir "$user_actual/screenshots/"
	echo 	
	echo "Creado con éxito"
	sleep 3
	clear
fi

#Script listo
echo "************************* Ejercicio 5 *************************"
echo "* Pasar un directorio como parámetro y realizar un screenshot *"
echo "***************************************************************"
echo

#Mostrar tipo "arbol"
# find (directorio) -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'

accion_script="$1"


#OPCION -c
#Esta opcion es para capturar un directorio
#Por defecto el directorio donde se realiza la captura es en el home del usuario /screenshots

if [ "$accion_script" = "-c" ]; then
	directorio_screenshot="$2"
	current_datetime=`date +"%d-%m-%Y_%H%M%S"`
	if [ -z "$directorio_screenshot" ]; then
		echo "Es necesario pasar el directorio como parámetro para realizar la captura"
		echo "Ejemplo: Ejercicio5.sh -c /etc/"
		echo
	else
		echo "El directorio a realizar el screenshot es: $directorio_screenshot"
		echo "Captura realizada en "$user_actual"/screenshots/scr_"$current_datetime".txt"
		echo "El contenido es: "
		find "$directorio_screenshot" -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g' #| more -20
		find "$directorio_screenshot" -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g' > "$user_actual"/screenshots/scr_"$current_datetime".txt
		nueva_carpeta_screenshot="$user_actual"/screenshots/.dir_scr_"$current_datetime"
		cp -R -p "$directorio_screenshot" "$nueva_carpeta_screenshot"
		echo "$directorio_screenshot" >> "$user_actual"/screenshots/scr_"$current_datetime".txt
		echo "$nueva_carpeta_screenshot" >> "$user_actual"/screenshots/scr_"$current_datetime".txt
	fi
	
elif [ "$accion_script" = "-d" ]; then
	#DIFF
	screen1="$2"
	screen2="$3"
	diff -q "$screen1" "$screen2"
	echo
	diff -y "$screen1" "$screen2"

elif [ "$accion_script" = "-l" ]; then
	#Listar estados
	ls -l "$user_actual"/screenshots/

elif [ "$accion_script" = "-r" ]; then
	#Restauracion de ficheros
	estado="$2"
	directorio_inicial=$(tail -n2 "$estado" | head -1)
	directorio_backup=$(tail -n1 "$estado")
	echo "Recuperando el directorio "$directorio_inicial""
	cp -R -p "$directorio_backup" "$directorio_inicial"
	sleep 2
	echo "*** Recuperado con éxito ***"
		
elif [ "$accion_script" = "-h" ]; then
	#Ayuda
	echo "**************************** Ayuda ****************************"
	echo "Ejercicio5.sh [-c] 'ruta directorio a capturar' > Realiza una screenshot del estado actual del directorio"
	echo "Ejercicio5.sh [-d] 'ruta directorio1' 'ruta directorio2' > Compara 2 screenshots y muestra las diferencias"
	echo "Ejercicio5.sh [-l] > Lista todas las diferencias"
	echo "Ejercicio5.sh [-r] 'estado A recuperar' 'directorio DONDE recuperar' > Selecciona el estado al que deseas volver y el directorio donde depositarlo"
	echo "Ejercicio5.sh [-h] > Muestra la ayuda del script"
	echo "***************************************************************"

else
	#Parametro no valido
	echo "******************** Parametro no válido *********************"
	echo "**************************** Ayuda ****************************"
	echo "Ejercicio5.sh [-c] 'ruta directorio a capturar' > Realiza una screenshot del estado actual del directorio"
	echo "Ejercicio5.sh [-d] 'ruta directorio1' 'ruta directorio2' > Compara 2 screenshots y muestra las diferencias"
	echo "Ejercicio5.sh [-l] > Lista todas las diferencias"
	echo "Ejercicio5.sh [-r] 'estado A recuperar' 'directorio DONDE recuperar' > Selecciona el estado al que deseas volver y el directorio donde depositarlo"
	echo "Ejercicio5.sh [-h] > Muestra la ayuda del script"
	echo "***************************************************************"
fi


