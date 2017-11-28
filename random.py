import math

Rm = 6378137
Mm1=5513
Mm2=3346
x = (Mm1/Mm2)
d = 1.26*(Rm*(x**(1/3)))

print(d/1000)
a = 274000000/2
a3 = a**3
p2 = (4*(math.pi**2)*a3)/((6.67e-11)*(5.68e26))
p = math.sqrt(p2)
print(p2)
print(p)
