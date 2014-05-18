#/bin/bash

# @name:	Ejercicio 6 Práctica final
# @desc: 	Papelera temporal
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
