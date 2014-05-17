#/bin/bash

# @name:	Ejercicio 1 Práctica final
# @desc: 	Script para crear usuarios y grupos en unos ficheros determinados
# @reqs:	Necesario tener './' añadido al PATH
# @author: 	Jose Luis Jimenez Urbano <@iJos>
# @date:	15/05/2014

clear

#Checkeamos si el user es root o no
if [ "$(id -u)" != "0" ]; then
	echo "Necesitas ejecutar el script como root..."
	sleep 2
	echo "...saliendo..."
	sleep 2
	exit
fi

#Creamos el fichero de usuarios
if [ ! -f "/etc/user_esat" ]; then
	echo "***** Configuración del script *****"
	echo
	echo "El directorio '/etc/user_esat' no existe, creando..."
	sleep 3
	touch "/etc/user_esat"
	echo 	
	echo "Creado con éxito"
	sleep 3
	clear
fi

#Creamos el ficheros de grupos
if [ ! -f "/etc/group_esat" ]; then
	echo "***** Configuración del script *****"
	echo
	echo "El directorio '/etc/group_esat' no existe, creando..."
	sleep 3
	sudo touch "/etc/group_esat"
	echo
	echo "Creado con éxito"
	sleep 3
	clear
fi

#Script listo
echo "********** Ejercicio 1 ***********"
echo "* Script de creación de Usuarios *"
echo "**********************************"
echo "1.- Crear usuario"
echo "2.- Salir"

read -r respuesta
clear

if [ "$respuesta" = "1" ]; then
	echo "Datos del usuario"
	read -p $"Username (minusculas)" username_usuario
	read -p $"Nombre: " nombre_usuario
	read -p $"Apellidos: " apellidos_usuario
	read -p $"Información adicional: " info_usuario
	read -p $"UID/GID del usuario:" gid_usuario
	echo	

#Creamos directorio home
	if [ ! -d "/home/$username_usuario" ]; then

		echo "**********************************"
		echo "********Datos introducidos********"
		echo "**********************************"
		echo "Nombre:      $nombre_usuario"
		echo "Apellidos:   $apellidos_usuario"
		echo "Información adicional: " $info_usuario
		echo "GID usuario: $gid_usuario"
		mkdir "/home/$username_usuario"

		#Introducimos el usuario en /etc/user_esat
		echo "$username_usuario:x:$gid_usuario:$gid_usuario:$nombre_usuario $apellidos_usuario $info_usuario:/home/$username_usuario:/bin/bash" >> /etc/user_esat
		echo "$username_usuario:x:$gid_usuario:" >> /etc/group_esat
		echo "***** Introducido con éxito *****"

	else
		echo "**********************************"
		echo "! ! ! El usuario  ya existía ! ! !"
		echo "**********************************"
		echo
		
		echo "...reiniciando..."
		sleep 3
		clear
		Ejercicio1.sh #Si no esta añadido ./ al PATH, este comando y el de mas abajo fallaran
	fi
	
elif [ "$respuesta" == "2" ]; then
	echo "Saliendo..."
	sleep 2
	clear
	exit
else
	echo "Selecciona alguna opción del menú"
	sleep 2
	Ejercicio1.sh
fi
