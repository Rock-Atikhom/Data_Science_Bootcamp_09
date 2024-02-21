## ESSENTIAL PYTHON PART TWO
## **HELLO WORLD**

TODAY WE'RE LEARNING PYTHON FOR BEGINNER DATA ANALYST.

FIVE KEY TOPICS THAT NEED TO KNOW

- VARIABLE
- DATA TYPE 
- DATA STRUCTURE
- CONTROL FLOW 
- FUNCTION

print("Hello Wolrd")


## LIST

- APPEND
- POP
- REPLACE
- INSERT
- SORT

movies = ["The Dark Knight", "Superman", "Beekeper"]

## DRY PRINCIPLE
## DO NOT REPEAT YOURSELF

for movie in movies:
    print(movie)


## TECHNIQUE: SAME RESULT AS APPEND

movies + ["Titanic", "Avatar"]

movies = movies + ["Titanic", "Avatar"]

print(movies)

"150" * 2

int("150") * 2


## PYTHON DYNAMIC TYPED LANGUAGE

a1 = "10"
a2 = 10
a3 = True
a4 = 10.1

for a in [a1, a2, a3, a4]:
    print(type(a))


## PYTHON TYPE HINT

name: str = "toy"
gpa: float = 3.45
age: int = 36
movies_lover: bool = True


print(name, gpa, age, movies_lover)


## TUPLE
## IMMUTABLE OBJECT

friends = ("toy", "john", "doe", "toy", "toy")

type(friends)

for name in friends:
    print("Hi!" + name)


## CONNOT UPDATE VALUE IN TUPLE
friends[0] = "TOY"

friends.count("toy")


## TUPLE UNPACKING

age_friends = (35, 30, 28)

toy, john, doe = age_friends

print(toy, john, doe)


## DEF NEW FUNCTION THAT RETURNS MORE THAN ONE VALUE

def add_two_num(x, y):
    print("Hello")
    return x + y
    print("Greeting")


## TEST FUNCTION

result = add_two_num(10,15)

print(result)


def create_book():
    return("BSM", "MMS", "Coach Builder")

b1, b2, b3 = create_book()

print(b1, b2, b3)


def create_book():
    return("BSM", "MMS", "Coach Builder", "freak")

b1, b2, _, b4 = create_book()

print(b1, b2, b4)


## DICTIONARY

- KEY-VALUE PAIR

## DICTIONARY IS MUTABLE OBJECT

customer01 = {
    "name": "toy",
    "age": 36,
    "city": "Bangkok"
}

customer01

customer01["name"]

customer01["age"]

customer01["city"]

customer01[0]


## DICTIONARY UPDATE

customer01["name"] = "John Wick"
customer01["age"] = 49
customer01["city"] = "New York"

customer01


## ADD NEW KEY

customer01["country"] = "United States"
customer01


## LOOP FOR DICTIONARY

customer01.keys()

customer01.values()

customer01.items()

for item in customer01.keys():
    print(item)

for item in customer01.values():
    print(item)

for item in customer01.items():
    print(item)

for item in customer01.items():
    print(item[0])

for item in customer01.items():
    print(item[1])


## CASE SENSITIVE

customer01["NAME"]


## CASE SENSITIVE

"hello" == "Hello"


## CASE SENSITIVE

Name = "Rock"
name = "Toy"

print(Name, name)


## DEVELOPMENT RECOMMENDS TO GET FUNCTION FROM DICTIONARY METHOD DOES NOT ERROR
## GET FUNCTION CAN FIND 

customer01.get("name")


## GET FUNCTION CANNOT FIND BUT GET FUNCTION DOES NOT RETURN ERROR BACK

customer01.get("Name")


## DELETE KEY

print(customer01)

customer01.pop("country")

print(customer01)


print(customer01)

del customer01["name"]

print(customer01)


## SET
## SET IN PYTHON IS UNIQUE
## SET IS UNDUPLICATED

numbers = [1,1,2,3,4,5,5,6,9,9]

set(numbers)


package = ["post", "pre", "pre", "post", "terminate"]

set(package)


set_a = {"banana", "apple"}
set_b = {"banana", "orange"}


## union

set_a | set_b


## INTERSECT

set_a & set_b

set.intersection(set_a,set_b)

set.union(set_a, set_b)


## CONTROL FLOW

- IF 
- FOR
- WHILE


## IF ELSE

score = 88

if score >= 80:
    print("Pass")
else:
    print("Failed")

score = 75


if score >= 80:
    print("A")
elif score >= 70:
    print("B")
elif score >= 60:
    print("C")
else:
    print("Failed")


score = 75

if score >= 60:
    print("C")
elif score >= 70:
    print("B")
elif score >= 80:
    print("A")
else:
    print("Failed")


## IF ELSE FUNCTION

def grading(score):

    if score >= 80:
        return "A"
    
    elif score >= 70:
        return "B"

    elif score >= 60:
        return "C"

    else:
        return "Failed"
    

grade = grading(85)
print(grade)


## IF FUNCTION IN ONE LINE

score = 85

print("Pass") if score >= 85 else print("Failed")


## FOR LOOP WITH UPPER

artists = ["Tayer Swift", 
           "Spice Girls", 
           "Backstreet Boys"]

for artist in artists:
    print(artist.upper())


## FOR LOOP WITH SPLIT

artists = ["Tayer Swift", 
           "Spice Girls", 
           "Backstreet Boys"]

for artist in artists:
    print(artist.split(" ")[0].upper())


## FOR LOOP

artists = ["Tayer Swift", 
           "Spice Girls", 
           "Backstreet Boys"]

for artist in artists:
    print(artist.split(" ")[1].upper())


## FOR LOOP

artists = ["Taylor Swift", 
           "Spice Girls", 
           "Backstreet Boys"]

for artist in artists:
    fist_name = artist.split(" ")[0].upper()
    if fist_name == "TAYLOR":
        print("Greed!, I'm going to see you in Japan.")
    else:
        print(fist_name)


## LIST COMPREHENSION

artists = ["Taylor Swift", 
           "Spice Girls", 
           "Backstreet Boys"]


upper_artists = [artist.upper() for artist  in artists]

print(upper_artists)


## COST OF PROGRAM: TIME

list(range(1,10)) ## N-1


## COST OF PROGRAM: TIME

list(range(1,11)) ## N-1


## COST OF PROGRAM: TIME

nums = list(range(1,10001)) ## N-1
print(nums)


## FOR LOOP

def sum_manual(nums):
    result = 0
    for num in nums:
        result = result + num
    return result

sum_manual(nums)


## FOR LOOP

def sum_manual(nums):
    result = 0
    for num in nums:
        result += num
    return result

sum_manual(nums)


## ALGORITHM

def sum_shortcut(nums):
    return (nums[0] + nums[-1]) * nums[-1] / 2

sum_shortcut(nums)


## WHILE
## INFINITE LOOP

n = 1 ## COUNTER

while n < 5:
    print("Hi")


## WHILE

n = 1 ## COUNTER

while n < 5:
    print("Hi")
    n += 1 ## UPDATE COUNTER


def game():
    print("This is a test game!")
    while True:
        user_input = input("Do you want to continue or stop?")
        if user_input == "stop":
            print("Game stop!")
            break
        else:
            print("Let's continue.")

game()
