# zadanie 1 ---------------------------------------------------------------

(moja_lista = list(c("Jeremiasz", "Pauszek"),3.14,sqrt,seq(0.1,1,by=0.1)))
# usuwanie elementów
moja_lista[1] <- NULL
moja_lista[2] <- NULL
moja_lista

#wykonanie funkcji na wszystkich elementach listy
lapply(moja_lista,gamma)


# zadanie 2 ---------------------------------------------------------------
# zaladowac package Matrix

#macierz
# 1 5 3
# 2 0 5
# 1 2 1
matr <- matrix(c(1,2,1,5,0,2,3,5,1),nrow=3, ncol=3)

rankMatrix(matr) # rzad macierzy
det(matr) # wyznacznik macierzy
eigen(matr) # wartosci wlasne i wektory wlasne
rowSums(matr) # sumowanie wiersza
rowSums(matr)/nrow(matr) #rowMeans(matr) # srednia wartosc w wierszu
colSums(matr) # sumowanie kolumny
colSums(matr)/ncol(matr) #colMeans(matr) # srednia wartosc w kolumnie
matr %*% solve(matr) # odwrotnosc macierzy

# zadanie 3 ---------------------------------------------------------------
# wektor pierwszych 100 liczb naturalnych podniesionych do kwadratu
table(factor(seq(1,100)^2%%10))

# zadanie 4 ---------------------------------------------------------------
# tabliczka mnozenia dla liczb mniejszych od 6
outer(1:5,1:5,FUN=function(x,y)paste(x, "*", y, "=", x*y))

# zadanie 5 ---------------------------------------------------------------
#Odczytaj zbiór danych dane1.csv a nastepnie:
#Z odczytanej ramki danych wyswietl tylko parzyste wiersze.
#Korzystajac z operatorów logicznych wyswietl tylko wiersze
#odpowiadajace pacjentkom starszym niz 50 lat z przerzutami 
#do wezlów chlonnych (wezly.chlonne = 1)
getwd()
#df = read.table('dane1.csv',header = TRUE)
df = read.csv2('dane1.csv')
View(df)
#df[((1:nrow(df))%%2)==0,]
df[seq(2,nrow(df), by=2),]

df[df$Wezly.chlonne == 1 & df$Wiek > 50,]


# zadanie 6 ---------------------------------------------------------------

to_celc <- function(x, npar=TRUE){
  result <- (x-32)*(5/9)
  return(round(result,digits = 2))
}

miesiac = c("Styczen", "Luty", "Marzec","Kwiecien","Maj","Czerwiec","Lipiec","Sierpien","Wrzesien","Pazdziernik","Listopad","Grudzien")
df <- data.frame(
  NY_F = c(32,33,41,52,62,72,77,75,68,58,47,35)
)
rownames(df) <- miesiac
NY_C = lapply(df$NY_F,to_celc) 
df$NY_C <- NY_C
colnames(df) <- c("NY_Farenheit", "NY_Celsiusz")
df$NY_Farenheit <- NULL
save(df, file = "NY_temp.RData")
