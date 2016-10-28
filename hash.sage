#(a) Write a Sage function that can generate the parameters of such a hash function, i.e. a pair of N and g.
def generate():
    p=random_prime(1000);p
    q=random_prime(1000);q
    N=p*q;
    g=randint(1,N);
    while gcd(g,N)!=1:
        g=randint(1,N);
    return p,q,N,g
       

result=generate();
p=result[0]
q=result[1]
N=result[2]
g=result[3]
print 'p=',p,'q=',q,'N=',N,'g=',g

#(b) Using N, g, and n as arguments to write a Sage function to perform the hashing.
def hash(x):
    R=IntegerModRing(N);
    return R(g)^x;

print 'hash(123412341234)=',hash(123412341234);

'''
(c) Write a Sage function that creates a collision given p and q. Note that this function should exploit the
above stated condition for a collision to occur for this hash function. It should not be done through a
brute force search. collision-- for every given n,we can have m that (m-n)mod phi_N=0
'''
def collision(x):
    phi_N=(p-1)*(q-1);
    k=randint(1,20);
    return x+k*phi_N;
n=randint(1,1000000);print 'n=',n

m=collision(n);print 'm=',m

print 'hash(m)=',hash(m);

print 'hash(n)=',hash(n);
