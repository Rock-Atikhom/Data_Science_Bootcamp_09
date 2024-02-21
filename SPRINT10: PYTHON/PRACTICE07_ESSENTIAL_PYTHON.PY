## ESSENTIAL PYTHON
## MERGE

import pandas as pd

import numpy as np


penguins = pd.read_csv("penguins.csv")

penguins.head()


## CREATE DICTIONARY

left = {
    'key': [1, 2, 3, 4],
    'name': ['Toy', 'Joe', 'Jane', 'Anne'],
    'age': [25, 28, 30, 22]
}

right = {
    'key': [1, 2, 3, 4],
    'city': ['Bangkok', 'London', 'Seoul', 'Tokyo'],
    'zip': [1001, 2504, 2094, 9802]
}

df_left = pd.DataFrame(left)
df_right = pd.DataFrame(right)


print(df_right)

pd.merge(df_left,df_right, on= 'key')


## HISTOGRAM WITH ONE COLUMN

penguins['body_mass_g'].plot(kind='hist');


## HISTOGRAM WITH TWO COLUMNS

penguins[['body_mass_g', 'bill_length_mm']].plot(kind='hist', bins = 30);


## HISTOGRAM FOR SPECIES

penguins['body_mass_g'].plot(kind='hist', bins = 30, color = 'orange');


## BAR PLOT FOR SPECIES

penguins['species'].value_counts().plot(kind='bar', color=['salmon', 'orange', 'gold'])


## SCATTER PLOT

penguins[['bill_length_mm', 'bill_depth_mm']] \
.plot(x='bill_length_mm', y='bill_depth_mm', kind='scatter', color = 'orange');


## DATALORE VISUALIZATION

penguins
