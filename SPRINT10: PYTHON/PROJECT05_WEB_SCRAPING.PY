## IMPORT MODULES FOR SCRAPING WEB

from bs4 import BeautifulSoup
import pandas as pd
import datetime
import requests
import smtplib
import time
import csv


## CONNECT TO WEBSITE

url = 'https://myanimelist.net/topanime.php'

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0'}

reqs = requests.get(url, headers=headers)

soup1 = BeautifulSoup(reqs.content, 'html.parser')

soup2 = BeautifulSoup(soup1.prettify(), 'html.parser')

ani_list = soup2.find_all('h3', {'class' : 'fl-l fs14 fw-b anime_ranking_h3'})

ani_score = soup2.find_all('td', {'class' : 'score ac fs14'})

# link = soup2.find('a', {'link-blue-box next'}).get('href')

col_ani = ['rank','title', 'score']
row_ani = [[]]


for i in range(50):

    index = i + 1

    list_gener = ani_list[i].get_text(strip=True)

    score_gener = ani_score[i].get_text(strip=True)

    row_ani.append([index, list_gener, score_gener])


## WRITE API TO CSV

with open('anime.csv', 'w', encoding='UTF-8') as file:
    writer = csv.writer(file)
    writer.writerow(col_ani)
    writer.writerows(row_ani)


## READ CSV FILE

anime = pd.read_csv('anime.csv')

anime
