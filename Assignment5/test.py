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