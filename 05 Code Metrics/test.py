a = 10
# this is a comment
while a <= 0:
    if a == 5:
        print(a)
    a += 1
print("exited")
fact = lambda x: 1 if x == 0 else x * fact(x-1)
print(fact(5))
