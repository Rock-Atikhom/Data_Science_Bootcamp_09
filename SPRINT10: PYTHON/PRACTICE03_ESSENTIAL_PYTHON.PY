## PANDAS
## IMPORT MODULES

import pandas as pd


## CREATE DATAFRAME FROM SCRATCH

raw_data = {
    "name": ["Rock", "Toy", "Mary", "Anna", "John"], 
    "age": [23, 33, 25, 21, 31],
    "gender": ["M", "M", "F", "F", "M"]
}

df = pd.DataFrame(raw_data)

df


## ADD A NEW COLUMN

df['cities'] = 'London'

df

df['cities'] = ["London", "London", "London", "Manchester", "Liverpool"]

df

df.shape


## DROP COLUMN = CITIES

df = df.drop('cities', axis=1)

df


## REMOVE INDEX = 2

df = df.drop(2, axis=0)

df


## RESET INDEX

df = df.reset_index(drop=True)

df


## COLUMN NAMES

list(df.columns)

df.columns


## RENAME COLUMN

df.columns = ["nickname", "age", "sex"]

df


## SERIES VS DATAFRAME

type(df["nickname"])

type(df)


## CREATE A NEW SERIES

s1 = pd.Series(['Mary', 20, 'F'], index=['nickname', 'age', 'sex'])

print(s1)

type(s1)

df = df.append(s1, ignore_index=True)

df

s2 = pd.Series(['London', 'London', 'London', 'Manchester', 'Liverpool'])

df['cities'] = s2

df


## WRITE TO CSV FILE

df.to_csv("mydata.csv")


## READ CSV FILE

df2 = pd.read_csv('DATA/data.csv')

df2


## READ EXCEL FILE

import pandas as pd

df3 = pd.read_excel('DATA/data.xlsx')

df3

df4 = pd.read_json('DATA/data.json')

df4

df4['favorite'].dtype
