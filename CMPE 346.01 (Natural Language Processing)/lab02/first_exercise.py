word=''#type is string
numbers=[1,2,3,4,5]
square_of_numbers=list()#creates an empty list
cubes_of_numbers=()

for number in numbers:
    print(number)
    square_of_numbers.append(number**2)
    cubes_of_numbers+=((number**3),)
print(square_of_numbers)
print(cubes_of_numbers)
for i in range(0,len(numbers)):
    print(numbers[i])

for x in range(1,11):
    print (x)

for y in range(0,21,4):
    print (y)
print('List Comprehension')
nums=[1,2,3,4,5]
squares = [num**2 for num in nums]
print (squares)
creatures = {'person':2,'cat':4,'spider':8}
print(creatures['spider'])
for creature in creatures:
    legs = creatures[creature]
    print ('A %s has %d legs' %(creature,legs))

for animal,legs in creatures.items():
    print ('A %s has %d legs' %(animal,legs))







x = 5
y = 10

if (x>y):
    print('The first value is greater than the second one')
elif (x<y):
    print('The second value is greater than the first one')
else:
    print('They are equal')