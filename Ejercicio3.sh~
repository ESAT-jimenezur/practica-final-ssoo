#/bin/bash

# @name:	Ejercicio 3 Práctica final
# @desc: 	Buscar y recuperar información del usuario
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

#Script listo
echo "**************** Ejercicio 3 *****************"
echo "* Buscar y recuperar información de usuarios *"
echo "**********************************************"
echo "1.- Buscar usuario"
echo "2.- Salir"

read -r respuesta
clear

if [ "$respuesta" = "1" ]; then
	echo "Datos del usuario"
	read -p $"Nombre de la cuenta de usuario a buscar: " username_usuario
	echo
	echo "Usuario a buscar -> " $username_usuario
	echo "... buscando ..."
	#sleep 3
	if [ `grep -c "$username_usuario" /etc/user_esat` -eq 1 ]; then
		echo " *** Encontrado *** "
		sleep 2
		clear
		echo " ¿Que datos quieres ver? "
		echo "1.- Todo"
		echo "2.- Nombre de usuario"
		echo "3.- Password"
		echo "4.- User ID (UID)"
		echo "5.- Group ID (GID)"
		echo "6.- Información adicional"
		echo "7.- Directorio Home"
		echo "8.- Shell por defecto" 
		echo "9.- Salir"
		read -r datos
		
		if [ "$datos" = "1" ]; then
			echo `cat /etc/user_esat | grep "$username_usuario"`
		elif [ "$datos" = "2" ]; then
			echo "Nombre de usuario: " `cat /etc/user_esat | grep "$username_usuario" | cut -d ":" -f1`
		elif [ "$datos" = "3" ]; then
			echo "Password: " `cat /etc/user_esat | grep "$username_usuario" | cut -d ":" -f2`
		elif [ "$datos" = "4" ]; then
			echo "User ID (UID): " `cat /etc/user_esat | grep "$username_usuario" | cut -d ":" -f3`
		elif [ "$datos" = "5" ]; then
			echo "Group ID (GID): " `cat /etc/user_esat | grep "$username_usuario" | cut -d ":" -f4`
		elif [ "$datos" = "6" ]; then
			echo "Información adicional: " `cat /etc/user_esat | grep "$username_usuario" | cut -d ":" -f5`
		elif [ "$datos" = "7" ]; then
			echo "Directorio Home: " `cat /etc/user_esat | grep "$username_usuario" | cut -d ":" -f6`
		elif [ "$datos" = "8" ]; then
			echo "Shell por defecto: " `cat /etc/user_esat | grep "$username_usuario" | cut -d ":" -f7`
		elif [ "$datos" = "9" ]; then
			echo "...saliendo..."
			sleep 2
			clear
			exit
		else
			echo "Esa opción no es correcta"
			sleep 2
			Ejercicio3.sh
		fi

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
	Ejercicio3.sh
fi
