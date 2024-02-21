## ESSENTIAL PYTHON PART ONE

def fdouble():
	## INT FLOAT STR BOOL
  num = float(input("Give me one number "))
  print(num * 2)
    
fdouble()

print("python".capitalize())

text = "a duck walks into a bar"

print(text.split(" "))

name = "Rock"
friend = "Zue"

text2 = "{} is going to have lunch with {}".format(name, friend)

print(text2)

a = 10
# b = 15
# print(a > b)
# print(a < b)

# print(a == b)
# print(a != b)
# print(a >= b)
# print(a <= b)


## TRUTH TABLE PRINCIPLE

a = 10
b = 15
c = 20
d = 25

print(a > b and c < d)


## START WITH LIST []

shopping_list = ["egg", "milk", "bread"]

#DRY: DO NOT REPEAT YOURSELF

print(shopping_list[0])
print(shopping_list[1])
print(shopping_list[2])

## YOU CAN DO THIS 

for item in shopping_list:
  print(item)

shopping_list2 = ["egg", "milk", "bread", "tissue", "salmon", "wine"]

#3DRY: DONOT REPEAT YOURSELF
# print(shopping_list[0])
# print(shopping_list[1])
# print(shopping_list[2])

for item in shopping_list2:
  print(item)


## FOR LOOP WITH IF 

for item in shopping_list2:
    if(item == "wine" or item == "milk"):
        print("liquid")
    else:
        print("item")


## FOR LOOP WITH SKIP LOOP

for item in shopping_list2:
    if(item == "wine" or item == "milk"):
        continue
    else:
        print("item")


## START FRESH FRUITS

fruits = ["apple", "banana", "orange"]

print(fruits)


## MUTABLE

fruits[0] = "green apple"
fruits[2] = "pineapple" 

print(fruits)


## IMMUTABLE

name = "Python"
print(name[0])
print(name[1])
print(name[5])

print(name[-1]) ## THE LAST CHARACTER
print(name[-2]) ## THE 2ND LAST CHARACTER


## REPLACE

name[0] = "C"
print(name)


## REPLACE

print(name.replace("P", "C"))
print("C" + name[1:])


## REPLACE

print(name.replace("P", "C"))
print("C" + name[1:])


## LIST METHOD (MUTABLE OBJECT)
## POP FUNCTION TO REMOVE THE LAST ITEM

print(fruits)

fruits.pop()

print(fruits)


## REMOVE 

fruits.remove("banana")
print(fruits)


## APPEND FUNCTION FROM LIST METHODS

fav_book = [
    "Naked Statistics",
    "Think Like a Freak",
    "Deep Work"
]

fav_book.append("Businedd Mad Simple")

print(fav_book)


## INSERT FUNCTION FROM LIST METHODS

fav_book.insert(1, "Coach Builder")

print(fav_book)


## SORT 

fav_book.sort() ## ASCENDING ORDER

print(fav_book)

fav_book.sort(reverse=True) ## DESCENDING ORDER

print(fav_book)
