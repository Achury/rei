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

**Sample request:**

`curl localhost:3000/ei/homework/st0263`

**Sample response:**

    [
      {
        "title": "Examen Parcial 2 - practico (2011-2)",
        "start_date": "2011/10/27 02:30 PM",
        "end_date": "2011/10/27 11:59 PM",
        "status": "Closed",
        "description": "<p>entrega de examen parcial</p>"
      },
      {
        "title": "Reto 3 (2011-2): implementación del SADP2P",
        "start_date": "2011/10/09 10:10 PM",
        "end_date": "2011/10/10 11:59 PM",
        "status": "Closed",
        "description": "<p>Entrega del reto de implementación del SADP2P.</p>\n<p>Aprovechando que ya se les activo el servidor, cada estudiante además de colocar aca el reto, debe generar un directorio \"reto03\" en el cual contenga el proyecto sw del reto y la documentación.</p>"
      }
    ]


Messages
---------

### Show

**Sample request:**

`curl localhost:3000/ei/messages/st0263`

**Sample response:**

    [
      {
        "subject": "actualizacion del seguimiento",
        "from": "Edwin Nelson Montoya Munera",
        "sent_at": "2011/11/11 09:19",
        "body": "<br><p>Actualice el archivo compartido de las notas, para tengan en cuenta:</p>\n<p>https://docs.google.com/spreadsheet/ccc?key=0Av4oKjh0Qca5dHQ5ZUZ4T1BBRzNDVndYUlZOYTc4d2c&amp;hl=es#gid=0</p>\n<p>a las 10 entro el seguimiento.</p>\n<p>     Edwin</p>\r\n      <br><br>"
      },
      {
        "subject": "Ingreso del seguimiento (40%) y reto5",
        "from": "Edwin Nelson Montoya Munera",
        "sent_at": "2011/11/11 08:29",
        "body": "<br><p>buenos días a todos,</p>\n<p>url de notas: https://docs.google.com/spreadsheet/ccc?key=0Av4oKjh0Qca5dHQ5ZUZ4T1BBRzNDVndYUlZOYTc4d2c&amp;hl=es&amp;pli=1#gid=0</p>\n<p>se confirma los porcentajes programados:</p>\n<p>parcial1 - 15%</p>\n<p>parcial2 - 15%</p>\n<p>seguimiento - 40%</p>\n<p>el seguimiento se discrimina así: 5 retos (c/uno de 6%) y los foros 10% (se promedian).</p>\n<p>Para darles chance que terminen bien el reto5, les coloque una nota promedio de 3.0 a todos, y tendrían HASTA ESTE LUNES FESTIVO EN LA TARDE, PARA SUBIR EL RETO 05 funcionando, y dependiendo de la evaluación, se ratifica esta nota, se sube o baja, y procedería a modificarla.</p>\n<p>Espero que este alargue les de chance de obtener una buena nota en este reto...</p>\n<p>    Edwin Montoya</p>\r\n      <br><br>"
      }
    ]

Resources
----------

### Show

**Sample request:**

`curl localhost:3000/ei/resources/st0263`

**Sample response:**

    [
      {
        "title": "archivos para examen parcial",
        "description": "archivos base para simulación de fuentes de datos.",
        "content": [
          {
            "text": "archivos-examen-parcial-2011-2.zip",
            "url": "/ei/adjuntos/descargar.do?id=2519181"
          }
        ],
        "leaf": true
      },
      {
        "title": "Actividades de Aprendizaje",
        "leaf": false,
        "content": [
          {
            "title": "Laboratorio de MPI",
            "description": "Laboratorio de MPI donde se explica el funcionamiento del cluster MPI, compilación, ejecución, estructura general de un programa y tipos para el reto.",
            "content": [
              {
                "text": "labmpi.pdf",
                "url": "/ei/adjuntos/descargar.do?id=2502953"
              }
            ],
            "leaf": true
          },
          {
            "title": "Reto No 4 - Chat en Web y WS",
            "description": "Implementación de un cliente Web y comunicaciones Web Service, para integrar las funcionalidades implementadas en el reto 01.",
            "content": [
              {
                "text": "reto4-chatwebws.pdf",
                "url": "/ei/adjuntos/descargar.do?id=2500309"
              }
            ],
            "leaf": true
          }
        ]
      },
      {
        "title": "Información del curso",
        "leaf": false,
        "content": [
          {
            "title": "Programa de la materia",
            "content": [
              {
                "text": "st0263-2011-2-031-programa.pdf",
                "url": "/ei/adjuntos/descargar.do?id=2356258"
              }
            ],
            "leaf": true
          }
        ]
      }
    ]