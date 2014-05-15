#/bin/bash

# @name:	Ejercicio 1 Práctica final
# @desc: 	Script para crear usuarios y grupos en unos ficheros determinados
# @author: 	Jose Luis Jimenez Urbano <@iJos>
# @date:	15/05/2014

clear

#Creamos el fichero de usuarios
if [ ! -f "/etc/user_esat" ]; then
	echo "***** Configuración del script *****"
	echo
	read -rsp $"El directorio '/etc/user_esat' no existe, creando..."
	echo 
	sudo touch "/etc/user_esat"
	echo 	
	read -rsp $"Creado con éxito"
	clear
fi

#Creamos el ficheros de grupos
if [ ! -f "/etc/group_esat" ]; then
	echo "***** Configuración del script *****"
	echo
	read -rsp $"El directorio '/etc/group_esat' no existe, creando..."
	echo
	sudo touch "/etc/group_esat"
	echo
	read -rsp $"Creado con éxito"
	clear
fi

#Script listo
echo "********** Ejercicio 1 ***********"
echo "* Script de creación de Usuarios *"
echo "**********************************"
echo "1.- Crear Usuario"
echo "2.- Salir"

read -rs respuesta
clear

if [ "$respuesta" = "1" ]; then
	echo "Datos del usuario"
	read -p $"Username (minusculas)" username_usuario
	read -p $"Nombre: " nombre_usuario
	read -p $"Apellidos: " apellidos_usuario
	read -p $"GID del usuario:" gid_usuario
	echo	

#Creamos directorio home
	if [ ! -d "/home/$username_usuario" ]; then

		echo "**********************************"
		echo "********Datos introducidos********"
		echo "**********************************"
		echo "Nombre:      $nombre_usuario"
		echo "Apellidos:   $apellidos_usuario"
		echo "GID usuario: $gid_usuario"
		sudo mkdir "/home/$username_usuario"

		#Introducimos el usuario en /etc/user_esat
		echo "$username_usuario:x:$gid_usuario:$gid_usuario:$nombre_usuario:/home/$username_usuario:/bin/bash" >> /etc/user_esat
		echo "$username_usuario:x:$gid_usuario:" >> /etc/group_esat
		echo "***** Introducido con éxito *****"

	else
		echo "**********************************"
		echo "! ! ! El usuario  ya existía ! ! !"
		echo "**********************************"
		echo
		
		read -rsp $"...reiniciando..."
		clear
		ejer1.sh
	fi
	
elif [ "$respuesta" == "2" ]; then
	read -rsp $"Saliendo..."
	clear
	exit
else
	read -rsp $"Selecciona alguna opción del menú"
	echo
	ejer1.sh
fi
