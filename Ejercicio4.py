# 4) Crear un lista en Python denominado “Perro2”
# que contenga los siguientes valores:
# 14,  Fido,  12/12/2012 , Macho, 23546987
# Recorrer la lista “Perro” con un bucle y mostrar sus elementos
# por pantalla , comenzando desde el último hasta el primero.

Perro = []
Perro1 = [16,  "Pupi",  "14/09/2010" , "Macho", 23546987]
Perro2 = [14,  "Fido",  "12/12/2012" , "Macho", 23546987]
Perro3 = [10,  "Lola",  "2/01/2017" , "Macho", 23546987]

Perro.append(Perro1)
Perro.append(Perro2)
Perro.append(Perro3)


print("Los datos de los perros son: ")
for perro in Perro[::-1]:
    print(perro)

print("Los datos del Perro2 son: ")
for datos in Perro2[::-1]:
    print(datos)
