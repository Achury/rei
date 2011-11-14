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
