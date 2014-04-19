m=rand(2:10)
n=rand(1:10)
Z = FrobeniusMatrix(m, randn(n)) #size m+n

#Special properties
@test_approx_eq full(inv(Z)) inv(full(Z))

#Matvec product
b = randn(m+n)
@test_approx_eq Z*b full(Z)*b

#Malmul product
Y1 = FrobeniusMatrix(m, randn(n)) #Another one of the same column
@test_approx_eq full(Y1*Z) full(Y1)*full(Z)

n2=rand(1:(m+n-1))
Y2 = FrobeniusMatrix(m+n-n2, randn(n2)) #Probably not the same column
@test_approx_eq full(Y2*Z) full(Y2)*full(Z)
