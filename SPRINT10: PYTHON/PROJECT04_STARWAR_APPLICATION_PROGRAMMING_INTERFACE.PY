## IMPORT MODULES FOR APPLICATION PROGRAMMING INTERFACE

import csv
import json
import numpy as np
import pandas as pd
from time import sleep
from requests import get


## STAR WAR APPLICATION PROGRAMMING INTERFACE

url = "https://swapi.dev/api/people/"
url_home = "https://swapi.dev/api/planets/"


## CREATE COLUMN FOR WRITING CSV FILE 

dictionary = ['name', 'height', 'gender', 'mass', 'homeworld']


## CREATE INDEX FOR WRITING CSV FILE

series = [[]]


## FOR LOOP

for i in range(31):
    index = i + 1
    new_url = url + str(index)
    home_url = url_home + str(index)
    reqs = get(new_url).json()
    world = get(home_url).json()

    ## CHECK API ERROR OR EMPTY VALUE

    try:
        name = reqs['name']
        height = reqs['height']
        mass = reqs['mass']
        gender = reqs['gender']
        homeworld = world['name']
        series.append([name, height, gender, mass, homeworld])

    ## IF API DOES NOT HAVE VALUE WILL ADDED MISSING VALUE INSTEAD

    except:
        np.nan


## WRITE JSON TO CSV FILE

with open('star_war.csv', 'w') as file:
    writer = csv.writer(file)
    writer.writerow(dictionary)
    writer.writerows(series)


## READ CSV FILE IN ORDER TO DISPLAY DATAFRAME

star_war = pd.read_csv('star_war.csv')


## CLEAN DATA

for col in star_war[['mass', 'height']]:
    star_war[col] = pd.to_numeric(star_war[col], errors='coerce')
    star_war = star_war.replace(to_replace=['none', 'unknown'], value=np.nan)

star_war
