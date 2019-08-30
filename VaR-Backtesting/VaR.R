stock = read.csv("AAPL.csv", header = TRUE)
ac = stock$Adj.Close
return = diff(ac)/ac[1:(length(ac)-1)]
X = -log(return+1)
a = 0.95
c = 1-a

#b
mu = mean(X)
sigma = sd(X)

#c
VaR.norm = sigma*qnorm(a) + mu
d = density(X)
plot(d,
     main = "Kernel Density vs. Normal with VaR Estimate",
     col = "red", lwd = 2)
polygon(d, col = "lightsalmon")
xfit = seq(min(X), max(X), length=length(X))
yfit = dnorm(xfit, mean = mu, sd = sigma)
lines(xfit, yfit, col = "blue", lwd = 3)
abline(v = VaR.norm, col = "red", lwd = 3)

#d
T = length(X)
R = length(X[X > VaR.norm])
TS.numer = R - c*T
TS.denom = sqrt(c*(1-c)*T)
TS = TS.numer/TS.denom
TS.pval = 2*(1 - pnorm(TS)) #Pr(|Z| > TS)
#Cannot reject null hypothesis.

#e
c.hat = R/T
LR.numer = c^R * (1-c)^(T-R)
LR.denom = c.hat^R * (1-c.hat)^(T-R)
LR = -2*log(LR.numer/LR.denom)
LR.pval = 1 - pchisq(LR, 1) #Pr(W > LR)
#Cannot reject null hypothesis.

#f
n00 = n01 = n10 = n11 = 0
cur = nxt = 0
if(X[1] >= VaR.norm){
  cur = 1
}
for(i in 1:(T-1)){
  if(X[i+1] >= VaR.norm){
    nxt = 1
  }else{
    nxt = 0
  }
  if(cur == 0 && nxt == 0){ 
    n00 = n00 + 1
  }else if(cur == 0){
    n01 = n01 + 1
  }else if(nxt*cur == 1){
    n11 = n11 + 1
  }else{
    n10 = n10 + 1
  }
  cur = nxt
}
pi0 = n01/(n00+n01)
pi1 = n11/(n10+n11)
pi = (n01+n11)/T
LRind.numer = (1-pi)^(n00+n10) * pi^(n01+n11)
LRind.denom = (1-pi0)^n00 * pi0^n01 * (1-pi1)^n10 * pi1^n11
LRind = -2*log(LRind.numer/LRind.denom)
LRind.pval = 1 - pchisq(LRind, 1)
#Cannot reject null hypothesis at 5% significance.
#However, since p-value is close to 0.05, a stronger conclusion could be reached with
#more data.