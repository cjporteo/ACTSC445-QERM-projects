library(MASS)
library(copula)

#######################################################################
#6a

dat1 = read.csv("PEP.csv", header = TRUE)
dat2 = read.csv("COKE.csv", header = TRUE)

J = as.numeric(dat1$Adj.Close)
K = as.numeric(dat2$Adj.Close)

X = log(J[2:length(J)]/J[1:(length(J)-1)])
Y = log(K[2:length(K)]/K[1:(length(K)-1)])

dates = as.Date(dat1$Date, origin = "2008-11-28") 

###########################
#a2

mean(X)
median(X)
sd(X)
quantile(X, 0.95)
quantile(X, 0.99)
quantile(X, 0.995)

mean(Y)
median(Y)
sd(Y)
quantile(Y, 0.95)
quantile(Y, 0.99)
quantile(Y, 0.995)

###########################
#a3

plot(X~dates[2:length(dates)], main="Daily Pepsi Log Returns", xlab="Date", ylab="Pepsi Log Returns")
plot(Y~dates[2:length(dates)], main="Daily Coke Log Returns", xlab="Date", ylab="Coke Log Returns")

#######################################################################
#6b
###########################
#b1

plot(X~Y, main="Pepsi vs. Coke Scatter Plot", xlab="Pepsi", ylab="Coke")
qqplot(X, Y, main="Pepsi vs. Coke QQ-plot", xlab="Pepsi", ylab="Coke")

#######################################################################
#6c
###########################
#c1/c2

cor(X, Y, method="pearson")
tauRight = 0.02*c(1:9)+0.78
tauLeft = -0.02*c(1:9)+0.22
extr = quantile(X, tauRight)
eytr = quantile(Y, tauRight)
extl = quantile(X, tauLeft)
eytl = quantile(Y, tauLeft)
corsubrp = corsublp = corsubrk = corsublk = corsubrs = corsubls = NULL
for(i in 1:9){
  filtxr = X[X>extr[i]]
  filtyr = Y[Y>eytr[i]]
  filtxl = X[X<=extl[i]]
  filtyl = Y[Y<=eytl[i]]
  
  corsubrp = c(corsubrp, cor(filtxr, filtyr, method="pearson"))
  corsublp = c(corsublp, cor(filtxl, filtyl, method="pearson"))
  
  corsubrk = c(corsubrk, cor(filtxr, filtyr, method="kendall"))
  corsublk = c(corsublk, cor(filtxl, filtyl, method="kendall"))
  
  corsubrs = c(corsubrs, cor(filtxr, filtyr, method="spearman"))
  corsubls = c(corsubls, cor(filtxl, filtyl, method="spearman"))
}

cbind(tauRight, extr, eytr, corsubrp, tauLeft, extl, eytl, corsublp)

#######################################################################
#6d
###########################
#d1

qX <- pnorm((X - mean(X))/sd(X))
qY <- pnorm((Y - mean(Y))/sd(Y))
plot(qX, qY, main="Pepsi vs. Coke Copula Scatter Plot", xlab="Pepsi", ylab="Coke")

###########################
#d2

cor(X, Y, method="kendall")
cor(X, Y, method="spearman")
cbind(tauRight, corsubrk, corsubrs, tauLeft, corsublk, corsubls)

###########################
#d3

ecdfX = ecdfY = NULL
for(i in 1:length(X)){
  currX = X[i]
  ecdfX = c(ecdfX, length(X[X<=currX])/length(X))
  currY = Y[i]
  ecdfY = c(ecdfY, length(Y[Y<=currY])/length(Y))
}

U = ecdfX
V = ecdfY
conprobsr = conprobsl = NULL
for(j in 1:length(tauRight)){
  ar = br = al = bl = 0
  qr = tauRight[j]
  ql = tauLeft[j]
  for(i in 1:length(U)){
    if(V[i] > qr){
      br = br + 1
      if(U[i] > qr){
        ar = ar + 1
      }
    }
    if(V[i] < ql){
      bl = bl + 1
      if(U[i] < ql){
        al = al + 1
      }
    }
  }
  conprobsr = c(conprobsr, ar/br)
  conprobsl = c(conprobsl, al/bl)
}
cbind(tauRight, conprobsr, tauLeft, conprobsl)

#######################################################################
#6e
###########################
#e1

bvn.mu <- c(mean(X), mean(Y))
bvn.sigma <- matrix( 
  c(var(X), sd(X)*sd(Y)*cor(X,Y),
    sd(X)*sd(Y)*cor(X,Y), var(Y)), 
    nrow=2, 
    ncol=2) 
bvn.mu
bvn.sigma

###########################
#e2

bvn.sim = mvrnorm(n = 10000, bvn.mu, bvn.sigma)
bvn.port = 10000*(exp(bvn.sim[,1]) + exp(bvn.sim[,2]))
bvn.port = sort(bvn.port)

alpha = c(0.8, 0.9, 0.95, 0.975, 0.995)
bvn.port.VaR = bvn.port[floor(10000*alpha)]
cbind(alpha, bvn.port.VaR)

#######################################################################
#6f
###########################
#f1

t.xfit = fitdistr(X, "t")
t.yfit = fitdistr(Y, "t")
t.xfit
t.yfit

###########################
#f2

U = pt((X - t.xfit$estimate["m"])/t.xfit$estimate["s"], t.xfit$estimate["df"])
V = pt((Y - t.yfit$estimate["m"])/t.yfit$estimate["s"], t.yfit$estimate["df"])

df <- data.frame(U,V)
m <- pobs(as.matrix(df))

cop_model1 <- tCopula(dim = 2)
fit1 <- fitCopula(cop_model1, m)

cop_model2 <- gumbelCopula(dim = 2)
fit2 <- fitCopula(cop_model2, m)

cop_model3 <- frankCopula(dim = 2)
fit3 <- fitCopula(cop_model3, m)

BIC1 = -2*as.numeric(logLik(fit1)) + 2*log(length(U))
BIC2 = -2*as.numeric(logLik(fit2)) + 1*log(length(U))
BIC3 = -2*as.numeric(logLik(fit3)) + 1*log(length(U))

c(BIC1, BIC2, BIC3)

#BIC1 is lowest. Choose t Copula

###########################
#f3

t.cop = tCopula(param=0.3597, df = 11.4702, dim = 2)
t.sim = rCopula(10000, t.cop)
X.t.sim = t.xfit$estimate["s"] * qt(t.sim[,1], t.xfit$estimate["df"]) + t.xfit$estimate["m"]
Y.t.sim = t.yfit$estimate["s"] * qt(t.sim[,2], t.yfit$estimate["df"]) + t.yfit$estimate["m"]
t.port = 10000*(exp(X.t.sim) + exp(Y.t.sim))
t.port = sort(t.port)

t.port.VaR = t.port[floor(10000*alpha)]
cbind(alpha, t.port.VaR)