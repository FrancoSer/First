# 2) Crear una lista en Python denominada “Dueno2” y recorrerla con un bucle mostrando sus elementos porpantalla con excepción 
# del DNI y el apellido. Los elementos de la lista son: 23546987, “Maria”, “Perez”, 4789689, “Pueyrredon 811” que representan 
# los datos del dueño de un perro (DNI, nombre, apellido, teléfono y dirección)

Dueno2 = [23546987, 'Maria', 'Perez', 4789689, 'Pueyrredon 811']
items = ['DNI', 'Nombre', 'Apellido', 'Teléfono', 'Dirección']
print('**Lista de Dueños**')
for i in range (len(items)):
    print('- '+ items[i], Dueno2[i], sep=': ')
