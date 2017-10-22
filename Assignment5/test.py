import math
def v(m, r):
    g = 6.67e-11
    ans = math.sqrt((2*g*m)/r)
    return ans

print((2*3.14*10000000)/v(5.974e24, 10000000))

def v2(m, r):
    g = 6.67e-11
    ans = (4*math.pi**2 * r**3)/(g*m)
    return math.sqrt(ans)

print(v2(2*(5.974e24), 10000000))

print("\n")

print((4*(math.pi**2)*350000**3)/((6.67e-11)*(3024000**2)))

print("\n")
print((math.sqrt((2*(6.67e-11)*(5.972e24))/(300000000)))/1000)

print("\n")

print(math.sqrt(2*9.8*1000))

print("\n")

g = 6.67e-11
Mearth = 5.972e24
r1 = 1/8000000
r2 = 1/9000000
print(g*Mearth*(r1-r2))