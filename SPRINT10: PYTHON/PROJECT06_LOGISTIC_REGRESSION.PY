## IMPORT MODULES FOR LOGISTIC REGRESSION

from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay

import pandas as pd


## READ CSV FILE

df_c = pd.read_csv('churn.csv')
df_c.head()


## CHECK MISSING VALUE

df_c.isnull().sum()


## CHANGE OBJECT TO CATEGORY DATATYPE

df_c['churn'] = df_c['churn'].astype('category')
df_c.info()


## SPLIT DATA

logis_model = LogisticRegression()

y = df_c['churn']
X = df_c[['accountlength', 'numbervmailmessages', 'totaldaycharge', 'totalevecharge','numbercustomerservicecalls']]

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42) 


## TRAIN MODEL

logis_model.fit(X_train, y_train)


## SCORE

train_model = logis_model.score(X_train, y_train)


## EVALUATE 

test_model = logis_model.score(X_test, y_test)


## CONFUSION MATRIX

pred = logis_model.predict(X_test)

conf = confusion_matrix(y_test, pred,labels=logis_model.classes_)

print(conf)

disp = ConfusionMatrixDisplay(confusion_matrix=conf,
                       display_labels=logis_model.classes_)

disp.plot();
