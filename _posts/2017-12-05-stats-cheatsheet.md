---
layout: post
title: "Stat 5301 Cheatsheet"
date: 2017-10-12
---

# Axioms
1. For any event, A, $P(A) \geq 0$
2. P(\Omega)=1
3. Probability of the union of disjoint events is additive: $P(A_1\cup A_2)=P(A_1)+P(A_2)$

# Definitions/Theorms
Definition of complementary probability: $P(A^C)=P(A')=1-P(A)$

Probability of the union of events: $P(A \cup B) = P(A)+P(B)-P(A \cap B)$

Intersection of Independent events: $P(A \cap B) = P(A)P(B)$

Definition of Conditional Probability: $P(A|B) = \frac{P(A \cap B)}{P(B)}$

Bayes Theorm: $P(A|B) = P(B|A)\frac{P(B)}{P(A)}$

Definition of Independent Events: $P(B) = P(B|A)$

# Distributions

-----------------------------------------------------------------------------------------------------------------
 Dist         Parameters     mean                 variance                      pmf or pdf cdf         quantile 
 ------------ -------------- -------------------- ----------------------------- ---------- ----------- ------   
 Bernouli     $p,q=1-p$      NA                   NA                            NA         NA          NA
                                                                                                                         

 Binomial     $n,p$          $np$                 $np(1-p)$                     dbinom     sum(dbinom) qbinom
                                                                                                                         

 Uniform      $p,\Omega$     NA                   NA                            NA         NA          NA
 (discrete)

 Uniform      $min=A,max=B$  $\frac{A+B}{2}$      $\frac{(B-A)^2}{12}$          dunif      punif       qunif
 (continuous)
 
 Normal       $\mu,\sigma$   $\mu$                $\sigma^2$                    dnorm      pnorm       qnorm

 Exponential  $rate=\lambda  $1/\lambda$          $(1/\lambda)^2$               dexp       pexp        qexp
              ,scale=\beta=                                
              1/\lambda$
              
 Gamma        $shape=\alpha  $\alpha\beta$        $\alpha\beta^2$               dgamma     pgamma      qgamma
              ,scale=\beta                                                                                        
              ,rate=1/\beta$                                                                                             
                                                                                                                         
                                                                                                                          

 Weibull      $scale=\lambda $\lambda\Gamma(1+    $\lambda^2\left[\Gamma(1+2/k)- dweibull   pweibull    qweibull 
              ,shape=k$      \frac{1}{k})$        (\Gamma(1+1/k))^2\right]$                                            
                                                                                                                          

 LogNormal    $\mu,\sigma$   $exp(\mu+            $[exp(\sigma^2)               dlnorm     plnorm      qlnorm 
                             \frac{\sigma^2}{2})$ -1]exp(2\mu+\sigma^2)$                                                 
                                                                                                                         
                                                                                                                       

 Beta         $shape1=\alpha $\frac{\alpha}       $\frac{\alpha\beta}           dbeta      pbeta       qbeta 
              ,shape2=\beta$ {\alpha+\beta}$      {(\alpha+\beta)^2                                                           
                                                  (\alpha+\beta+1)}$
-----------------------------------------------------------------------------------------------------------------
 

 
 
