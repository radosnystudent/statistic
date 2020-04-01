# zadanie 1 ---------------------------------------------------------------
#importuj dane z pliku ankieta.txt do zmiennej ankieta
ankieta <- read.table("ankieta.txt", header=TRUE)

#rozkład empiryczny zmiennej wynik za pomocą szeregu rozdzielczego
data.frame(cbind(liczebnosc = table(ankieta['wynik']),
                 procent = prop.table(table(ankieta['wynik']))))

#rozkład empiryczny zmiennej wynik tylko dla osób z wykształceniem podstawowym za pomocą szeregu rozdzielczego.
x <- ankieta[ankieta$szkola == 'p',]$wynik

data.frame(cbind(liczebnosc = table(x),
                 procent = prop.table(table(x))))


#Zilustruj wyniki ankiety za pomocą wykresu słupkowego i kołowego.

barplot(table(ankieta$wynik),
        xlab="Odpowiedzi", ylab="Liczebnosc",
        main="Rozklad empiryczny zmiennej wynik",
        col=1:5)

barplot(prop.table(table(ankieta$wynik)),
        xlab="Odpowiedzi", ylab="Prawdopodobienstwo",
        main="Rozklad empiryczny zmiennej wynik",
        col=1:5)

pie(table(ankieta$wynik))

#Zilustruj wyniki ankiety za pomocą wykresu słupkowego z podziałem na kobiety i mężczyzn.
barplot(table(ankieta$wynik,ankieta$plec),
        beside = TRUE,
        xlab="odpowiedzi",
        col=1:5)


# zad 2 -------------------------------------------------------------------
#Zaimportuj dane z pliku Centrala.RData.
#Przedstaw rozkład empiryczny liczby zgłoszeń za pomocą szeregu rozdzielczego.

load("Centrala.RData")
Centrala
data.frame(cbind(liczebnosc = table(Centrala),
                 procent = prop.table(table(Centrala))))
data.frame(cbind(liczebnosc = table(Centrala),
                 procent = prop.table(table(Centrala))))

#Zilustruj liczbę zgłoszeń za pomocą wykresu słupkowego i kołowego.
barplot(table(Centrala),
        xlab="Liczba zgloszen", ylab="Liczebnosc",
        main="Rozklad empiryczny liczby zgloszen",
        col=1:5)

barplot(prop.table(table(Centrala)),
        xlab="Liczba zgloszen", ylab="Prawdopodobienstwo",
        main="Rozklad empiryczny liczby zgloszen",
        col=1:5)

pie(table(Centrala))

#Obliczyć średnią z liczby zgłoszeń, medianę liczby zgłoszeń, 
#odchylenie standardowe liczby zgłoszeń i współczynnik zmienności liczby zgłoszeń.
mean(Centrala$Liczba)
median(Centrala$Liczba)
sd(Centrala$Liczba)
sd(Centrala$Liczba) / mean(Centrala$Liczba) * 100

# zad 3 -------------------------------------------------------------------
#Przedstaw rozkład empiryczny badanej zmiennej za pomocą szeregu rozdzielczego.

wiatr = c(0.9,6.2,2.1,4.1,7.3,1.0,4.6,6.4,3.8,5.0,2.7,9.2,5.9,7.4,3.0,4.9,8.2,5.0,1.2,10.1,12.2,2.8,5.9,8.2,0.5)
rozklad <- hist(wiatr, plot = FALSE)$breaks
w <- table(cut(wiatr,breaks=c(0,2,4,6,8,10,12)))
data.frame(cbind(liczebnosc = table(cut(wiatr,breaks=rozklad)),
                 procent = prop.table(table(cut(wiatr, breaks=rozklad)))))

#rozkład empiryczny średniej szybkości wiatru za pomocą histogramu i wykresu pudełkowego.
hist(wiatr, 
     xlab = "Srednia predkosc wiatru", 
     main = "Rozklad empiryczny sredniej szybkosci wiatru",
     col = "white")

hist(wiatr, 
     xlab = "Srednia predkosc wiatru", 
     main = "Rozklad empiryczny sredniej szybkosci wiatru",
     probability = TRUE, 
     col = "lightblue")
lines(density(wiatr), col = "lightgreen", lwd = 2)

boxplot(wiatr, 
        ylab = "Srednia predkosc wiatru", 
        main = "Rozklad empiryczny sredniej predkosci wiatru")

#Obliczyć średnią, medianę, odchylenie standardowe, współczynnik zmienności, 
#współczynnik asymetrii i kurtozę średniej szybkości wiatru.
mean(wiatr)
median(wiatr)
sd(wiatr)
sd(wiatr) / mean(wiatr) * 100

library(e1071)
skewness(wiatr)
kurtosis(wiatr)


# zad 5 -------------------------------------------------------------------
#funkcja wspolczynnik_zmiennosci(), która oblicza wartość współczynnika zmienności dla danego wektora
#Funkcja powinna mieć dwa argumenty:
#x - wektor zawierający dane,
#na.rm - wartość logiczna (domyślnie FALSE), która wskazuje czy braki danych (obiekty NA) mają być zignorowane.
#Funkcja: zwraca wartość współczynnika zmienności wyrażoną w procentach,
#sprawdza czy wektor x jest wektorem numerycznym
#jesli nie, to komunikat 'argument nie jest liczbą’. 

wspolczynnik_zmiennosci <- function(x, na.rm = FALSE){
  if(na.rm==TRUE) y <- x[!is.na(x)]
  else y <- x
  if(is.numeric(y)) return (sd(y)/mean(y)*100)
  else return("Argument nie jest liczba!")
}
wspolczynnik_zmiennosci(c(1,NA,3))
wspolczynnik_zmiennosci(c(1,NA,3),na.rm=TRUE)
wspolczynnik_zmiennosci()
wspolczynnik_zmiennosci(c("x", "y"))
