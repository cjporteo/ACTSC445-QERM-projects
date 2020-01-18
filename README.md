# Quantitative Enterprise Risk Management Projects

These projects were completed as course requirements for ACTSC445 (Quantitative Enterprise Risk Management) at University of Waterloo.

Various RM analysis techniques were conducted in R on real world stock data downloaded from [Yahoo Finance](https://ca.finance.yahoo.com/). Each project is accompanied with a PowerPoint file to describe code output, visualizations, and conclusions.

These R scripts are flexible concerning new stock data; the included *.csv* files can be replaced with other data and the code will function after minimal revision. 

Snippets from the full analysis are included here.

## VaR Backtesting (AAPL)

Used 3 methods of backtesting (Binomial, POF, Conditionality) to verify estimated 95% value-at-risk for negative log return of Apple Inc. (AAPL) stock value.

<br>

![1](https://i.imgur.com/OExSyJ7.png) 

<br>

## Extreme Value Theory (AMZN)

Compared Value-at-Risk of Amazon.com, Inc. (AMZN) stock value over a 10-year period using Block Maxima and Threshold Exceedance based methods to quantify risk-level as a stockholder.

Required Packages:

 - ``evd`` (Extreme Value Distributions)
 - ``evir`` (Extreme Values in R)
 - ``fExtremes`` (Rmetrics - Modelling Extreme Events in Finance)

<br>

![1](https://i.imgur.com/EaoYCJP.png)

<br>

![2](https://i.imgur.com/yuLA6Rd.png)

<br>

![3](https://i.imgur.com/XajGsRL.png)

<br>

## Copula-Based Multivariate Dependency (PEP/KO)
Employed a variety of extensive multivariate analysis techniques to identify patterns and correlations between stock data from The Coca-Cola Company (KO) and PepsiCo, Inc. (PEP) over an 8-year period.

Required packages:

 - ``copula`` (Multivariate Dependence with Copulas)
 - ``MASS`` (Modern Applied Statistics with S - Various Functions)
 
 <br>
 
 ![1](https://i.imgur.com/wypg5ZN.png)

<br>

![2](https://i.imgur.com/pRuc3p5.png)

<br>

![3](https://i.imgur.com/Zw4vQ8M.png)

<br>

![4](https://i.imgur.com/s0eCl4Z.png)

<br>

![5](https://i.imgur.com/Kwc3FRb.png)
