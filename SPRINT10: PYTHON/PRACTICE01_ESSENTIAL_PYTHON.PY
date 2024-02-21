my_name = "Rock"
my_age = 23


print(my_name)
print(my_age)


## CALCULATION

print(1+1)
print(2*2)
print(5/2)
print(8-5)


## STRING IN PYTHON

my_name = "Rock"
my_university = 'Silpakorn'

my_long_string = """This is very long string
    This is second line
    This is third line
"""

print(my_name, my_university, my_long_string)


## FSTRING TEMPLATE

text = f"My name is {my_name}, and I'm {my_age} years old"

print(text)


## FUNCTION DESIGNED FOR STRING (METHODS)

text = "a duck walks into a bar"



## STRING METHODS

print(text.upper())


## COUNT STRING

count01 = text.count("a")
count02 = text.count("duck")

print(count01) 
print(count02)


## REPLACE STRING

text2 = text.replace("duck", "lion")

print(text)
print(text2)

type(text)


## LIST

shoping_list = ['egg', 'milk', 'bread']

print(shoping_list)

print(shoping_list[0])
print(shoping_list[1])
print(shoping_list[2])

print(shoping_list[0:2])


## LIST METHODS = APPEND FUNCTION TO ADD ITEM

shoping_list.append('orange juice')

print(shoping_list)

shoping_list.append('water bottle')

print(shoping_list)


## LIST METHODS = POP FUNCTION TO REMOVE LAST ITEM

shoping_list.pop()

print(shoping_list)


## LEN

len(shoping_list)


## DICTIONARY KEY-VALUE PAIR

student = {
    "id": 1,
    "name": "Rock",
    "age": 23,
    "movies": ["Spider Man", "Thor", "Iron Man"]
}

print(student)

type(student)

student["name"]

student["movies"]

student["movies"][0]

student["movies"][2]

student["movies"][1]


## UPDATE KEY-VALUE

student["city"] = "London"

student["city"] = "Manchester"

student


## REMOVE KEY-VALUE

del student["city"]

student


## USER-DEFINED FUNCTION

def hello():
    print("Hello")
    print("I am learning Python")

hello()


def welcome(username):
    print("Hello: " + username)

welcome("Rock")


def my_sum(val1, val2):
    print(val1 + val2)

my_sum(2,2)


def my_gold(val1, val2):
    return val1 + val2

result = my_gold(2,3)
result
