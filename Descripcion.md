#Idea

###Modelo del sistema distribuido

Busqueda y recuperación de información distribuida

La idea de estas aplicación es crear un web service que emule un usuario 
para poder acceder a toda la información y las calificaciones 
que provee la universidad a sus estudiantes.

De esta manera el web service va a crear un "Dashboard" donde tendra 
la informacion actualizada y notificara al usuario cuando haya cambios
o articulos nuevos en EAFIT Interactiva y Ulises.

###Justificación

La información del estudiante esta almacenada en diferentes sistemas
dentro de la universidad. Para el estudiante esto es poco práctico 
puesto que debe entrar a cada sistema independientemente a consultar
las novedades (por ejemplo, para consultar las notas y el horario 
es necesario ingresar a Ulises y para consultar las entregas de trabajos
y los articulos de clase es necesario ingresar a EAFIT Interactiva).

Adicional a este inconveniente la universidad no presta un servicio de 
API o web service para consultar esta informacion. Esto obliga al estudiante
a usar EAFIT Interactiva y Ulises. 

Nosotros queremos solucionar esta necesidad al crear un web service que publique 
la informacion almacenada en estos dos sistemas de la universidad, de esta manera el 
estudiante puede crear su propia herramienta que consume los datos ofrecidos por 
nuestro web service y asi no se ve obligado a utilizar Ulises y EAFIT Interactiva
si no que puede ver un resumen rapido, integrado y actualizado de la información.

Como prueba de concepto vamos a desarrollar un "Dashboard" donde el estudiante puede
ver un resumen para cada materia que contiene el horario, las notas, los mensajes 
enviados por EAFIT Interactiva, las entregas de trabajo y los contenidos; toda esta 
informacion organizada en un mismo lugar.

###Relación con el sistema emergente

Este reto tiene dos partes principalmente: la primera es escribir un programa que sea 
capaz de extraer la información de EI y Ulises sin necesidad de interacción con el 
usuario; la segunda es crear el servicio web que expone los datos extraídos.

Ambas partes estan relacionadas con el modelo emergente de Busqueda y recuperación de 
información distribuida pues se necesita consultar y categorizar información de otros 
sistemas. Esto es una tendencia que ha tomado fuerza en la web en los ultimos años, 
puesto que cada vez es mas facil integrar sistemas independientes.









