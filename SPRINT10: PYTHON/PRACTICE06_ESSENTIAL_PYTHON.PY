## OOP = OBJECT ORIENTED PROGRAMMING
## ARCHETYPE

class Book:
    def __init__(self, name, year, author):
        self.name = name 
        self.year = year
        self.author = author

book1 = Book("think like a freak", 2010, "Dubner")
book2 = Book("Business Made Sumple", 2018,"Donal Miller")
book3 = Book("Data Science for Business", 2015, "Wiley")


## HOW TO ACCESS ATRRIBUTE
## DOT NOTATION WITH NAME

[book1.name,
book2.name,
book3.name]


## HOW TO ACCESS ATRRIBUTE
## DOT NOTATION WITH AUTHOR

[book1.author,
 book2.author,
 book3.author]


## HOW TO ACCESS ATRRIBUTE
## DOT NOTATION WITH YEAR

[book1.year,
 book2.year,
 book3.year]


## DOG

class Dog:
    ## ATTRIBUTE OF DOG

    def __init__(self, name, age, specie):
        self.name = name
        self.age = age
        self.specie = specie

    ## DOG METHODS
    
    def setting(self):
        print("I'm sitting on the bed.")

    def get_order(self, year):
        self.age += year
        print(f"I'm getting older {year} year. ")


## DOG ATTRIBUTES

dog1 = Dog("Andy", 3, "Chihuahua")

print(dog1.name, dog1.age, dog1.specie)


## DOG METHODS

dog1.setting()


## DOG METHODS

print(dog1.age)

dog1.get_order(2)

print(dog1.age)


class DataAnalyst():
    def __init__(self, name, company):
        self.name = name
        self.company = company

    def hello(self):
        print(f"{self.name} works at {self.company}")


toy = DataAnalyst("Toy", "Google")

print(toy.name, toy.company)

toy.hello()
