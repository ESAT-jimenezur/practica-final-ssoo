#/bin/bash

# @name:	Ejercicio 2 Práctica final
# @desc: 	Script para buscar y eliminar un usuario y su directorio personal
# @reqs:	Necesario tener './' añadido al PATH
# @author: 	Jose Luis Jimenez Urbano <@iJos>
# @date:	17/05/2014

clear

#Checkeamos si el user es root o no
if [ "$(id -u)" != "0" ]; then
	echo "Necesitas ejecutar el script como root..."
	sleep 2
	echo "...saliendo..."
	sleep 2
	exit
fi

#Iniciamos Script
echo "************ Ejercicio 2 *************"
echo "* Búsqueda y eliminación de usuarios *"
echo "**************************************"
echo "1.- Buscar usuario a elmininar"
echo "2.- Salir"

read -r respuesta
clear

if [ "$respuesta" = "1" ]; then
	echo "Datos del usuario"
	read -p $"Nombre de la cuenta de usuario a eliminar: " username_usuario
	echo
	echo "Usuario a eliminar -> " $username_usuario
	echo "... buscando ..."
	#sleep 3
	if [ `grep -c "$username_usuario" /etc/user_esat` -eq 1 ]; then
		echo "<¡-!- Encontrado -¡-!>"
		#Usuario encontrado, ahora eliminamos su home y la linea de /etc/user_esat
		#Eliminamos su directorio home (Si existe)

		#Vamos a reescribir en un fichero auxiliar, y luego rehacer el inicial
		`grep -v "$username_usuario" /etc/user_esat > /etc/user_esat_aux; mv /etc/user_esat_aux /etc/user_esat`

		
		
	else
		echo " *** ¡ Usuario no encontrado ! *** "
		echo "...saliendo..."
		sleep 2
		exit
	fi
	
	

elif [ "$respuesta" == "2" ]; then
	echo "...saliendo..."
	sleep 2
	clear
	exit
else
	echo "Selecciona alguna opción del menú"
	sleep 2
	Ejercicio2.sh
fi
