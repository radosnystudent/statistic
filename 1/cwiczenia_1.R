# zadanie 2 ---------------------------------------------------------------

x <- c(rep(TRUE,3), rep(FALSE,4), rep(TRUE,2), rep(FALSE,5))
x

num_x = as.numeric(x)
num_x


# zadanie 3 ---------------------------------------------------------------

start = c(seq(1,20),rep(0,10), seq(2, by=2, len=20))
palindrome = c(start,rev(start))
palindrome


# zadanie 4 ---------------------------------------------------------------
# wybieranie liter z wektora letters od 5 miejsca do 25 miejsca
# co piata litere
letters[c(seq(5,25,by=5))]


# zadanie 5 ---------------------------------------------------------------
# Utwórz wektor liczb naturalnych od 1 do 1000, a nastepnie zamien liczby parzyste na ich odwrotnosci.
n_values = c(seq(1,1000))
n_values[seq(2,1000,by=2)] <- 1/n_values[seq(2,1000,by=2)] # n_values[seq(2,1000,by=2)]^-1
round(n_values, digits=3)


# zadanie 6 ---------------------------------------------------------------
# uporzadkowanie elementow wektora malejaco
# order zwraca indeksy!!!!
not_ordered = c(6,3,4,5,2,3)
ordered = not_ordered[order(not_ordered,decreasing = TRUE)]
ordered


# zadanie 7 ---------------------------------------------------------------
# sign do zwracania znaku elementu
# floor - zaokraglenie w dol
signs = c(-1.876,-1.123,-0.123,0,0.123,1.123,1.876)
sign(signs)
round(signs,digits=2)
floor(round(signs,digits=2))


# zadanie 8 ---------------------------------------------------------------
# roznica przy pierwiastkowaniu funkcja sqrt i podnoszac do potegi 1/2
million = seq(1,100000000)
Sys.time()
s1 = sqrt(million)
Sys.time()
s2 = million^(1/2)
Sys.time()


# zadanie 9 ---------------------------------------------------------------
# wykorzystanie primlist w package schoolmath
# najwiekszej liczby pierwszej mniejszej od 1000
# ile jest liczb pierwszych > 100 i < 500
data(primlist)
max(primlist[primlist < 1000])
sum(primlist > 100 & primlist < 500)


# zadanie 10 --------------------------------------------------------------
# Wyznacz wszystkie kombinacje wartosci wektorów 
# (a,b)i (1,2,3)za pomoca funkcji rep() i paste()

paste(c(rep("a",3),rep("b",3)),1:3,sep="")

# zadanie 11 --------------------------------------------------------------
# 30 napisów typu liczba.litera - liczby 1-30, litery X,Y,Z
paste(1:30,c('X','Y','Z'),sep='.')

# zadanie 12 --------------------------------------------------------------
# pakiet carData
# wygenerowanie 100 odpowiedzi od a do e i zakodowanie ich: 
# a i b jako 1, c i d jako 2, e jako 3
f = sample(c(letters[1:5]), 100, replace=T)
recode(f, "c('a','b')='1' ; c('c','d')='2' ; c('e')='3'")