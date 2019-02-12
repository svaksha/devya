def function(a, b):
    a = 'value'
    b = b + 1
# a and b are local variables that are used to assign the new objects
    return a, b
# This is the function that is used to return the value stored in b
x = "apple"
y = 22
c, d = function(x, y)
print(c)
print(d)
