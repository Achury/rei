#Idea

###Modelo del sistema distribuido

**Búsqueda y recuperación de información distribuida**

En los últimos años, se ha aumentado el número de sistemas que utilizan
información distribuida en otros sistemas. Esto ha creado nuevos retos
en computación, puesto que el volumen de datos tiende a crecer en modelos
distribuidos. Por ejemplo, con respecto a búsquedas distribuidas,
se han propuesto mecanismos de búsqueda sobre
textos en entornos con múltiples bases de datos independientes [1].

En el área de recolección y extracción automática de información
de diversas fuentes también se han presentado avances. Por
ejemplo, un sistema para aplicar técnicas de *scraping* a la librería digital de
la ACM [2] ó una herramienta para extracción de información de páginas web basada
en un lenguaje declarativo similar a XML [3].

Estos retos nos parecen muy interesantes puesto que tienen una aplicación inmediata
y práctica: permiten centralizar la información de manera cómoda y rápida para minimizar
el tiempo perdido en tareas repetitivas como entrar a diferentes sitios web a consultar
fragmentos de información.

###Descripción de la aplicación

Dentro de la universidad, la información de un estudiante está almacenada
en diferentes sistemas. Para el estudiante esto es poco práctico 
puesto que debe entrar a cada sistema independientemente a consultar
las novedades (por ejemplo, para consultar las notas y el horario 
es necesario ingresar a Ulises y para consultar las entregas de trabajos
y los artículos de clase es necesario ingresar a EAFIT Interactiva).

Adicional a este inconveniente la universidad no presta un servicio de 
API o *web service* para consultar esta información. Esto obliga al estudiante
a entrar al sitio web de EAFIT Interactiva y Ulises.

Nosotros queremos solucionar esta necesidad al crear un *web service* que publique 
la información almacenada en estos dos sistemas de la universidad. De esta manera el 
estudiante podría crear su propia herramienta que consuma los datos ofrecidos por 
nuestro *web service* y así no se ve obligado a entrar a Ulises y a EAFIT Interactiva por separado
sino que puede ver un resumen integrado y actualizado de la información.

Como prueba de concepto vamos a desarrollar un *dashboard* donde el estudiante puede
ver un resumen centralizado de la información de cada materia. En este caso, para cada matería
se mostrará: el horario, las notas, los mensajes 
enviados por el profesor, las entregas de trabajo y los contenidos subidos a EAFIT Interactiva.

###Relación con el sistema emergente

Este reto tiene dos partes principalmente: la primera es escribir un programa que sea 
capaz de extraer la información de EAFIT Interactiva y Ulises sin necesidad de interacción con el 
usuario (para esto pensamos aplicar técnicas de *scraping*); la segunda es crear el servicio web que expone los datos extraídos.

Ambas partes estan relacionadas con el modelo emergente de búsqueda y recuperación de 
información distribuida pues se necesita consultar y categorizar información de otros 
sistemas.

## Referencias

* **[1]**: Callan, J. *Advances in Information Retrieval: Distributed Information Retrieval*. Springer, 2006.

  DOI: http://dx.doi.org/10.1007/0-306-47019-5_5

* **[2]**: Bergmark, D.; Phempoonpanich, P.; Zhao, S. *Scraping the ACM Digital Library*. ACM SIGIR Forum 35, 2001.

  DOI: http://dx.doi.org/10.1145/511144.511146
  
* **[3]**: Beno, M.; Misek, J.; Zavoral, F.; *AgentMat: Framework for data scraping and semantization*. IEEE RCIS, 2009.

  DOI: http://dx.doi.org/10.1109/RCIS.2009.5089286