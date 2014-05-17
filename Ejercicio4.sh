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
