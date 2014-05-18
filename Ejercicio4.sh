#/bin/bash

# @name:	Ejercicio 4 Práctica final
# @desc: 	Añadir un usuario a un grupo especifico
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
echo "*************** Ejercicio 4 ****************"
echo "* Buscar un usuario y asignarlo a un grupo *"
echo "********************************************"
echo "1.- Buscar usuario"
echo "2.- Salir"

read -r respuesta
clear

if [ "$respuesta" = "1" ]; then
	echo "Datos del usuario"
	read -p $"Nombre de la cuenta de usuario a buscar: " username_usuario
	echo
	read -p $"¿En que grupo quieres dar de alta al usuario $username_usuario?: " grupo_usuario
	echo
	echo "Usuario a buscar 		-> " $username_usuario
	echo "Dar de alta en el grupo 	-> " $grupo_usuario
	echo "... buscando usuario ..."
	sleep 2
	
	if [ `grep -c "$username_usuario" /etc/user_esat` -eq 1 ]; then
		echo " *** Usuario Encontrado *** "
		sleep 1
		echo "... buscando grupo ..." 
		sleep 1
		
		if [ `grep -c "$grupo_usuario" /etc/group_esat` -eq 1 ]; then
			echo " *** Grupo Encontrado *** "
			sleep 1
			echo "... dando de alta al usuario $username_usuario en el grupo $grupo_usuario ..."
		username_aux=`cat /etc/user_esat | grep "$username_usuario" | cut -d ":" -f1`
		### CONTINUE HERE ###
			
		else
			echo " *** ¡ Grupo no encontrado ! *** "
			echo "...saliendo..."
			sleep 2
			exit
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
