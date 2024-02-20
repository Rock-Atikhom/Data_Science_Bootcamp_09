## DEFINE FUNCTION FOR CREATING OBJECT-ORIENTED PROGRAMMING

class Occupation():
    def __init__(self, name, age, position, skill, company):
        self.name = name
        self.age = age
        self.position = position
        self.skill = skill
        self.company = company

    def greeting(self, year):
        self.age = year
        print(f"Great to See Everyone! My Name is {self.name}!, I'm On Level {self.age}")

    def work(self):
        print(f"My Role As A {self.position} At {self.company}")

    def ability(self):
        print(f"I'm Passionate About Using Data to Solve Problems And Uncover Insights With Foundation in {self.skill}, And I'm Up For the Challenge!")

## INPUT THE INFORMATION 

data01 = Occupation("Rock", 23, "Data Analyst", ["Spreadsheets", "SQL", "R Programming", "Python", "Power Bi"], "Inuyashiki Company")
