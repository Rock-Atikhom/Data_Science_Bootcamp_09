## WEB SCRAPING
## INSTALL LIBRARY

!pip install gazpacho


## IMPORT MODULES
## IMPORT LIBRARY

import requests
import gazpacho as gz


## SKOODIO MEDIUM WEBSITE

url = "https://medium.com/skooldio"


## REQUEST CONTENT FROM MEDIUM  

response = requests.get(url)
print(response.status_code)


## TRANSFORM TO SOUP OBJECT

web = gz.Soup(response.text)


# FIND THE ELEMENT YOU WANT - H1

web.find("h1")


# ## FIND THE ELEMENT YOU WANT - H2

web.find("h2")


## TEXT AND STRIPA

h1 = web.find("h1")

h2 = web.find("h2")


print(h1.text)

print(h2.strip())
