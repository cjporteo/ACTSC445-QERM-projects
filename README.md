# Quantitative Enterprise Risk Management Projects

These projects were completed as course requirements for ACTSC445 (Quantitative Enterprise Risk Management) at University of Waterloo.

Various RM analysis techniques were conducted in R on real world stock data downloaded from [Yahoo Finance](https://ca.finance.yahoo.com/). Each project is accompanied with a PowerPoint file to describe code output, visualizations, and conclusions.

These R scripts are flexible concerning new stock data; the included *.csv* files can be replaced with other data and the code will function with minimal revision. 

Snippets from the full analysis are included here.

## VaR Backtesting (AAPL)

Used 3 methods of backtesting (Binomial, POF, Conditionality) to verify estimated 95% value-at-risk for negative log return of Apple Inc. (AAPL) stock value.

<br>

![1](https://scontent.fybz2-2.fna.fbcdn.net/v/t1.15752-9/69324405_3061705534054667_8467236717907148800_n.png?_nc_cat=107&_nc_oc=AQk-cpOOOXysqL4X-wEVYV4d1P1Qc9Cih5HGHzlvXB8wknefPL2BCcJz9omdFTvuI6U&_nc_ht=scontent.fybz2-2.fna&oh=d2454211f2e2dd19d0a822d609d70568&oe=5E0FA8BD) 

<br>

## Extreme Value Theory (AMZN)

Compared Value-at-Risk of Amazon.com, Inc. (AMZN) stock value over a 10-year period using Block Maxima and Threshold Exceedance based methods to quantify risk-level as a stockholder.

Required Packages:

 - ``evd`` (Extreme Value Distributions)
 - ``evir`` (Extreme Values in R)
 - ``fExtremes`` (Rmetrics - Modelling Extreme Events in Finance)

<br>

![1](https://scontent.fybz2-1.fna.fbcdn.net/v/t1.15752-9/69266237_512920856131692_9163907858159370240_n.png?_nc_cat=100&_nc_oc=AQkrMeVAGO68RRflD4SGqMS_R8_0EOcddd17TfRqiNLLjs2k49qcctzpWG1jnqNPELA&_nc_ht=scontent.fybz2-1.fna&oh=993a430ca435b6b6faf565708fe9b399&oe=5DC907AF)

<br>

![2](https://scontent.fybz2-2.fna.fbcdn.net/v/t1.15752-9/70321442_358944651654615_3944296947292045312_n.png?_nc_cat=104&_nc_oc=AQk4wUZaRKQwFQ1BuurMqPowL1A5xoLkdBnilwrZjpdKPPv4bLez5yCGOceryHa9MPk&_nc_ht=scontent.fybz2-2.fna&oh=03ac8f9d36a4c7a1a7651b075902e799&oe=5E00796E)

<br>

![3](https://scontent.fybz2-2.fna.fbcdn.net/v/t1.15752-9/69252816_981900662151564_8994899804140077056_n.png?_nc_cat=105&_nc_oc=AQkQxgezLQBqzKUjRfYUN6kt-ZG0nlFgxK4AUSiRDXxFJO8xMPqlmM1B_bQdUZUaQyY&_nc_ht=scontent.fybz2-2.fna&oh=d34c284b7d93e9e6dda2563b61b5db52&oe=5E070699)

<br>

## Copula-Based Multivariate Dependency (PEP/KO)
Employed a variety of extensive multivariate analysis techniques to identify patterns and correlations between stock data from The Coca-Cola Company (KO) and PepsiCo, Inc. (PEP) over an 8-year period.

Required packages:

 - ``copula`` (Multivariate Dependence with Copulas)
 - ``MASS`` (Modern Applied Statistics with S - Various Functions)
 
 <br>
 
 ![1](https://scontent.fybz2-2.fna.fbcdn.net/v/t1.15752-9/69277767_897903000560910_2766183230406131712_n.png?_nc_cat=107&_nc_oc=AQnH-1ihFGC8sSgzHDbSugL1D0i1V9EVQnY54RzHtavenZH_oEU0gmNFjo6Z3bPdc4g&_nc_ht=scontent.fybz2-2.fna&oh=5ed890f50963088aba6a71eea09e06b5&oe=5DD218FE)

<br>

![2](https://scontent.fybz2-1.fna.fbcdn.net/v/t1.15752-9/69321046_1364029317082794_1605621125008588800_n.png?_nc_cat=110&_nc_oc=AQkgHs6X9aHA9n5-RgNhBdAKTcqMGaY-HcZun7gN3NiKF9n6ALbqS5JrFpjkFCXjdwY&_nc_ht=scontent.fybz2-1.fna&oh=fb09700c774c53877eff517dc70b3582&oe=5E0FC2CD)

<br>

![3](https://scontent.fybz2-1.fna.fbcdn.net/v/t1.15752-9/69687735_498233177673180_953753928242036736_n.png?_nc_cat=108&_nc_oc=AQlWl45InX6vqyFVF28w759WPPS1O9WvOzHc5Xpf9Wng3p3VXTxIBMocA5LKYUcLBvc&_nc_ht=scontent.fybz2-1.fna&oh=ba4e0dbc027e036017d202329b397404&oe=5E0D30B6)

<br>

![4](https://scontent.fybz2-1.fna.fbcdn.net/v/t1.15752-9/69668283_373776653504542_7766912725149548544_n.png?_nc_cat=100&_nc_oc=AQlGZAp3WFxIQlZJHpCA4umFWqojwZOjn3cOx-ReL-RxVyKqTH6P6Wlag4B7nU6eMrM&_nc_ht=scontent.fybz2-1.fna&oh=e4973fc2059585c1e29d8ae44c0f1ed8&oe=5E070167)

<br>

![5](https://scontent.fybz2-2.fna.fbcdn.net/v/t1.15752-9/69170956_741445246313374_400854941322706944_n.png?_nc_cat=102&_nc_oc=AQlsOViMR4KcW_99b4uXUqSNT9kljyELojdQ9Q6U-O36fTgzuWJtqI21IC2Zhc7xfOI&_nc_ht=scontent.fybz2-2.fna&oh=6fa0f309105a287ab1a033f43eb26b68&oe=5DCC1074)
