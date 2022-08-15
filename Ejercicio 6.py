#3)  Crear un lista en Python denominado “Perro” que contenga los siguientes valores:
#   13,  Puppy,  12/12/2012 , Macho, 123
#Que se corresponde con los datos de un perro de nuestra base de datos (Id_Perro, nombre, fecha de nacimiento, sexo y dni del
#dueño). Modificar la fecha de nacimiento por 13/12/2012 y reemplazar “dni del dueño” por 28957346 .

Perro=[13,'Puppy','12/12/2012','Macho',123]
print(Perro)
Perro[2]='13/12/2012'
Perro[4]=28957346
print(Perro)

#6)Crear una tupla en Python con el nombre de “Historial2” la cual contenga los siguientes valores:
#   23500, 5960, 2300, 10200, 8900
#Que representa montos de atención en pesos por diferentes servicios/consultas de la mascota “Frida”. Calcular el monto total
#gastado a lo largo del tiempo por atención de “Frida”. Crear una función que cuente cuantos gastos fueron superiores a 5000
#mostrando  el número calculado en pantalla.


Historial12=(23500, 5960, 2300, 10200, 8900)
print("Montos de atencion en pesos por servicios/consultas:",Historial12)
suma=0
for i in Historial12:
    suma+=i
print("Monto total gastado:",suma)

def gastossup(Historial12):
    contador=0
    for i in Historial12:
        if i>5000:
            contador=contador+1
    print("Cantidad de gastos superiores a $5000:",contador)

variable=gastossup(Historial12)




