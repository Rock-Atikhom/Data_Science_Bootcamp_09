## OBJECT ORIENTED PROGRAMMING

class Dog:
    name = "Rock"
    age = 15
    color = "Brown"
    breed = "French Bulldog"

    ## FUNCTION (DOG METHOD)

    def sitting(self):
        print("I am sitting now")
    def hungry(self, food_name):
        print(f"I am hungry, I need {food_name}!")

my_dog = Dog()

type(my_dog)

my_dog.age

my_dog.breed

my_dog.color

my_dog.name

my_dog.sitting()

my_dog.hungry("hamburger")
