API Documentation
=================

Authentication
--------------
All requests must have a `username` and `password` parameter. Otherwise, you'll get:

    {
      "error": "Missing username or password"
    }

If the username or password is not correct, you'll get:

    {
      "error": "Invalid username or password"
    }

From now on, these parameters will not be shown for the sake of simplicity.

Schedule
--------

### Show

**Sample request:** 

`curl localhost:3000/ulises/schedule`

**Sample response:**

    [
      {
        "course": "ST0263 - TÓPICOS ESPECIALES EN TELEMÁTICA",
        "group": "031",
        "credits": "3",
        "rooms": [
          "16-201",
          "16-202"
        ],
        "hours": [
          "10:00-12:00",
          "11:00-12:00"
        ],
        "days": [
          "M",
          "J"
        ],
        "start_dates": [
          "20110718",
          "20110718"
        ],
        "end_dates": [
          "20111112",
          "20111112"
        ],
        "campus": [
          "MEDELLÍN",
          "MEDELLÍN"
        ]
      },
      {
        "course": "ST0275 - COMPUTACIÓN GRÁFICA",
        "group": "031",
        "credits": "3",
        "rooms": [
          "17-204",
          "07-104"
        ],
        "hours": [
          "08:00-10:00",
          "15:00-16:00"
        ],
        "days": [
          "L",
          "W"
        ],
        "start_dates": [
          "20110718",
          "20110718"
        ],
        "end_dates": [
          "20111112",
          "20111112"
        ],
        "campus": [
          "MEDELLÍN",
          "MEDELLÍN"
        ]
      }
    ]


Grades
------

### Index

**Sample request:**

`curl localhost:3000/ulises/grades`

**Sample response:**

    [
      {
        "course": "ST0263 - TÓPICOS ESPECIALES EN TELEMÁTICA",
        "graded_percentage": "70.0",
        "average_grade": "4.20",
        "grades": [
          {
            "assignment": "PARCIAL (Análisis y Diseño de Aplicaciones Distribuidas)",
            "grade": "4.2",
            "percentage": "15.0"
          },
          {
            "assignment": "PARCIAL (Implementación de sistemas Distribuidos)",
            "grade": "5.0",
            "percentage": "15.0"
          },
          {
            "assignment": "SEGUIMIENTO (retos, actividades, foros, etc.)",
            "grade": "3.9",
            "percentage": "40.0"
          }
        ]
      },
      {
        "course": "ST0275 - COMPUTACIÓN GRÁFICA",
        "graded_percentage": "75.0",
        "average_grade": "4.73",
        "grades": [
          {
            "assignment": "PARCIAL (Examen Parcial)",
            "grade": "5.0",
            "percentage": "15.0"
          },
          {
            "assignment": "PARCIAL (Práctica 1)",
            "grade": "4.4",
            "percentage": "20.0"
          },
          {
            "assignment": "PARCIAL (Práctica 2)",
            "grade": "4.6",
            "percentage": "20.0"
          },
          {
            "assignment": "SEGUIMIENTO (Retos de programación)",
            "grade": "5.0",
            "percentage": "20.0"
          }
        ]
      }
    ]

Homework
--------

### Show

    [
      {
        "title": "Reto 1 - 20112 - Segmentos de línea",
        "start_date": "2011/07/27 05:00 PM",
        "end_date": "2011/08/02 11:59 PM",
        "status": "Closed",
        "description": "<p>Grupos de 1 o 2 personas:</p>\n<p>- Implmentar los algoritmos de Bresenham y uno intiutivo (con variables de punto flotante) y dibujar las líneas, dentro de un cuadrado, que circunscriben un círculo.</p>\n<p>Grupos de 3 personas:</p>\n<p>- Implementar, adicionalmente, la ecuación de segmento de recta.</p>\n<p>Entregar:</p>\n<p>1. Archivo texto con los tiempos que toma dibujar 10,000 líneas con cada algoritmo</p>\n<p>2. El código fuente de los algoritmos implementados (solamente el archivo .c o .cpp)</p>\n<p>3. Un pantallazo.</p>\n<p>Meter todo a un archivo .zip o .rar y ponerle el nombre de los integrantes.</p>"
      },
      {
        "title": "Reto 2 - 20112 - Clipping",
        "start_date": "2011/08/03 03:00 PM",
        "end_date": "2011/08/09 11:59 PM",
        "status": "Closed",
        "description": "<p>Para practicar el clipping en 2D:</p>\n<p>1. Definir un área rectangular de clipping y dibujarla en negro.</p>\n<p>2. Generar, aleatoriamente, segmentos de recta que estén contenidos en la ventana. Repetir el proceso hasta que se haya generado (y dibujado):</p>\n<p>* Un segmento que esté completamente dentro del área de clipping</p>\n<p>* Un segmento que esté completamente fuera del área de clipping</p>\n<p>* Un segmento que esté parcialmente adentro y parcialmente afuera del área de clipping</p>\n<p>En todos los casos, dibujar de verde la parte del segmento que esté dentro del área de clipping y en rojo la parte que esté afuera.</p>\n<p>Se pueden usar las primitivas de OpenGL para dibujar líneas.</p>"
      }
    ]
