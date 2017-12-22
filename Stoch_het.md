---
title: "Stochasticity and heterogeneity"
author: "Bruce Kendall"
date: "June 16, 2017"
output: pdf_document
---

# Genotypes, phenotypes, fitness, and demography
[Need to unpack and provide examples of the various "environments" below]

The genotype is, well, the genotype, characterized as in pop gen or quantitative genetics. We call it $G$.

The phenotype, $Z$ is anything that might, in principle, be measured in an individual. Many phenotypic traits can only be measured by disrupting the individual's life to some degree (ranging from catching and anesthetizing to killing), so in a population study there will be some traits that will not be measured in practice. Some phenotypic traits that change regularly throughout an individul's life (e.g., size) are often called "states," and it will often be useful to qualify such traits by age (e.g., size at age).

The development of the phenotype depends on the individual's genotype and the developmental environment, $E_z$: $Z = g(G, E_z)$.

Fitness components, $W$, are quantities such as an individual's annual survival probaility, instantaneous mortality hazard, expected reproductive success at a given age, or expected lifetime reproductive success. These are not observable at the individual level. They depend on the individual's phenotype and on its fitness environment, $E_w$: $W = f(Z, E_w)$.

An individual's demographic outcome, $X$, is zero or one for death or not, or actual number of offspring for reproduction. It depends on phenotype and the demographic environment, $E_d$. An example of the latter could be whether a predator happened to pass through the individual's territory, and if so, whether the individual was away from cover at the time. In practice, we rarely observe the full set of environmental conditions that lead to a demographic outcome, and so it is treated as a stochastic process. It is commonly called "demographic stochasticity," but note that some factors might be correlated among individuals (e.g., the value of "predator passed through my territory" will be positively correlated with that of neighboring territories, although not with more distant members of teh population).

There are some characteristics of individuals that fit into the defintion of phenotype above that we treat specially. The first is the genotype itself, which was considered unmeasureable when the science of genetics was founded but is measureable now; we keep it separate from the phenotype for consistency with pop gen and QG.

The second is calendar age, which is independent of genotype and has a simple dependence on two development al environment variables: date of birth and current date. If an organism senesces according to a strict molecular clock, then age can be a useful phenotypic variable with a causal effect on fitness; in practice it is often a convenient proxy for variables such as accumulated cell damage. However, age has a much more fundamental role in translating fitness components into fitness (e.g., reproduction at age 3 has a different fitness value than reproduction at age 30).

The third are demographic outcomes. These can, of course, be measured on individuals; but by and large, they are the outcome variables of interest, both because they represent individual contributions to future generations and because, summed over individuals, they represent population dynamics. Like age, however, prior demographic outcomes (primarily annual reproductive success) can be proxies for unmeasured physiological or energetic phenotypes.

[Talk about estimation---issues include inobservability of $W$]

# Decomposing the variance in demographic and population outcomes
We want to know how heterogeneity affects the variance in demographic and population outcomes. First let's unpack what these mean.

Let $X_i$ be the demographic outcome of individual $i$ (e.g., for annual survival, it is zero if the individual dies and one if it lives). $X_i$ is observable, so the variance among individuals in the population in demographic outcomes (whichi we will call $V_X$) can, in principle, be calculated from data. $V_X$ can also be calculated for a model, either for a finite number of individuals using an individual-based simulation, or in expectation using some other kind of model. This is the outcome of interest in Hartemink et al. (2017), who are modeling the variance in longevity. The key question here is *What is heterogeneity's contribution to the the observed variance among individuals?*

In contrast, authors such as Kendall & Fox have asked *What is heterogeneity's contribution to the variance due to demographic stochasticity?* Although demographic stochasticity derives from the variance in demographic outcomes, the question here is instead about the distribution of mean outcommes: in a finite population, what is the variance in mean realized demography across replicate populations? This is of interest in generating the variance in possible future population tracjectories, for example to stochastic population models. We approach this by defining the mean demographic outcome in population replicate $j$, $Y_j = \frac{1}{n_j}\sum_{i=1}^{n_j} X_{i,j}$ and then calculating its expectation, $E[Y]$, and variance, $V_Y$, across replicate populations. $V_Y$ is the sampling variance of $\bar X$; if (and only if) the $X_i$ are independent, it can be estimated as $\hat{V_Y} = V_X / n$. Correlations among individuals, either in heterogeneity in underlying fitness or in the stochastic process leading from fitness to realized demography, will lead to a different relationship.

[Note that everywhere below where I wrote $V_p$ I should have written something to represent the variance in $E[X|p]$. I'm not sure how to do notation....]

Hartemink et al point out that if individuals differ in some parameter, which we'll call $p$, that affects the individual's expected $X$ (i.e., its fitness) and variance in $X$, then it can be modeled as a mixture distribution. This allows us to write $V_X = V_p + E[V_{X|p}]$, where the second expectation is taken over the distribution of $p$. Hartemink et al. call the first term the "heterogeneity variance" and the second term the "stochasticity variance."

Our observation is that, unless $V_{X|p}$ is linear in $p$, its value will also be affected by $V_p$. To make this explicit, we can write $V_X = V_p + V_X^0 + \left(E[V_{X|p}] - V_X^0\right)$, where $V_X^0$ is the variance in $X$ in the absence of heterogeneity. If we call $V_X^0$ the stochasticity variance, then the final term is the interaction, and we can conceptually write $V_X = H + S + H \times S$, where H and S are the heterogeneity and stochastic variances and HxS is their interaction.

The challenge of this is defining the parameter values to use for the homogeneous model that generates $V_X^0$. There are a number of approaches that might be justified in different circumstances:

1. Replace $p_i$ with the mean of $p$. This is appropriate for theoretical studies looking at the effects of heterogeneity in a particular process.
2. Replace $p_i$ with the value of $p$ that gives the same mean demographic outcome as the heterogeneous model. This isolates heterogeneity's effects on the demographic variance from its effects on mean outcomes through nonlinear averaging and cohort selection. If an individual's expected demographic outcome is a linear funtion of $p$ this will be equivalent to the previous rule. (One of Yngevild's papers argues for this)
3. FIt the homogeneous model to the data, allowing parameters other than $p$ (if any) to be re-estimated as well. This is the closest analogy to empirical model selection, comparing the heterogeneous and homogeneous model in their fit to the data. For a sufficiently flexible model, then at least some fitting methods (e.g., method of moments, fitting the momements of the distribution) will match the observed variance exactly, so that $V_X^0 = V_X$; this may make the whole exercise trivial.

Page 7 of Het_synthesis.pdf develops this (using sligntly different notation) for Bernoulli survival and Poisson reproduction, for which homogeneous limits 1 and 2 above are equivalent. Page 8 develops this for an exponential survival model assuming heterogeneity in annual survival, with homogeneous limit 1. If this were recast in terms of expected longevity, $l$, then $E[X|l] = l$ and $V_{X|l} = l^2$. Thus, if $l$ has heterogeneity variance $V_l$, then a Taylor expansion gives us $E[V_{X|l}] = E[l]^2 + V_l$. The stochasticity variance is simply $V_X^0 = E[l]^2$, so the interaction variance is $V_l$. This is quite different from the previous formulation, where the ratio of the interaction variance to the heterogeneity variance depends on the variance in the parameter.

Hmm, I'm no longer sure that this is quite the right way to go. A true "interaction" would be a covariance. Here the issue is a functional one: $V_S = f(V_H)$, where $V_S$ and $V_H$ are the stochasticity and heterogeneity varience sensu Hartemink et al. A way to capture this without going to a hypothetical homogenous population would be to look at $d V_S/d V_H$.

Perhaps an approach that is a little less circular is to use a Taylor expansion to note that 
$$
E[V_{X|p}] \approx V_{X|\bar p} + \frac12 \frac{d^2 V_{X|\bar p}}{d p^2} V_p.
$$
Here we have a non-arbitary reference ($\bar p$) *and* we get to link back to our original work. But is there a defensible reason to call the first term the "stochasticity variance" and the second term the "interaction"?

We can also note that if higher-order derivatives are non-zero (which would be true for the exponential distribution in either paramterization) then the higher moments of the heterogeneity distribution might also come into play. This could be an issue in the exponential distribution, where both expected annual survival and expected longevity will often be skewed (in opposite directions, if mean survival > 0.5). [Are there assumptions about the shape of the frailty distribution in a proportional hazards model? A lognormal would be an obvious one to use, which (since the mean is fixed at 1) would have a skew that is increasing in the variance.]

Do the decomposition for $V_Y$ - here the correlations among individuals matter.

Let $w_i$ be an individual's fitness component (it might be a function of some other "parameter" $p$ [phenotypic trait, environment, other fitness component], but we leave that aside for now). The distribution of fitness components across individuals has mean $E[w]$ and variance $V_w$. The individual's demographic outcome, $X_i$, has mean $w_i$ and variance $V_{X|w_i}$. We can write $X_i = w_i + d_i$, where $d_i$ is the demographic deviance (with mean zero and varaince $V_{X|w_i}$) and is uncorrelated with $w_i$.

Let $Y = \frac1n \sum_{i=1}^n X_i$ be the mean demographic outcome across the population. Its expected value is $E[w]$. Its variance is:
$$\begin{aligned}
V_Y & = E[(Y - E[Y])^2] \\
&= E[Y^2] - E[Y]^2 \\
&= \frac{1}{n^2} E\left[\left(\sum_{i=1}^n w_i + d_i\right)^2\right] - E[w]^2\\
&= \frac{1}{n^2} E\left[\sum_{i=1}^n \sum_{j=1}^n w_i w_j + w_i d_j + d_i w_j + d_i d_j\right] - E[w]^2\\
&= \frac{1}{n^2} E\left[\sum_{i=1}^n (w_i^2 + d_i^2) + \sum_{i=1}^n \sum_{j\ne i} (w_i w_j + 2 w_i d_j + d_i d_j)\right] - E[w]^2\\
&= \frac{1}{n^2} \left[n E[w^2] + n E[d^2] + n (n-1) (\gamma + E[w]^2) + n(n-1) \tau\right] - E[w]^2
\end{aligned}$$
where $\gamma = cov(w_i, w_j), i \ne j$ is the mean covariance among fitness values (e.g., due to relatedness or shared environments) and $\tau = cov(d_i, d_j), i \ne j$ is the demographic covariance of Engen et al. (1998) (e.g., correlated fates of nestmates due to nest predation). w and d are uncorrelated by construction. Thus we have 
$$\begin{aligned}
V_Y & = \frac1n [V_w + E[w]^2 + E[V_{X|w}] - \gamma - \tau - E[w]^2 + n(\gamma + \tau + E[w]^2)] - E[w]^2\\
&= \frac1n [V_w + E[V_{X|w}]] + \frac{n-1}{n}(\gamma+\tau)
\end{aligned}$$
SOmething doesn't seem right about the scaling of the final term - maybe I didn't do the covariances right.

# Old stuff from September 2016

Here is where I work out notation and derivations on this topic; relevant bits will then be moved to the main manuscript.

# Stop presses! The fundamental differences between "demographic stochasticity" and "individual variation in demography"

I was trying to work out the effects of correlated heterogeneity (e.g., the extreme case in our first paper of exactly half the individuals being of each type, which generates a negative covariance in paramters) on the mixture model that Hal uses (below and in the main ms), and getting helplessly tied up in knots, because it seemed to have no effect. For example, if half the individuals have trait $\mu + \sigma$ and the other half have trait $\mu - \sigma$, the trait variance among individuals (what goes into the second part of the variance decomposition) is still $\sigma^2$, just as it would be (in expectation) if each individual independently drew its trait with a 50:50 odds ratio. Carrying through the calculation, the correlation has no impact on the variance among individual outcomes as well (of course, this assumes that the $d_i$ [see below] are independent of one another, and of the trait value).

So what the heck is going on? It finally dawned on my that there is a deep and fundamental difference between what Hal is focused on and what we are focused on.

Let $X_i$ be the demographic outcome of individual $i$. Hal is interested in understanding variability among individuals in indidual outcomes, calculating $M_1 = E[X]$ and $V_1 = E[(X-M_1)^2]$, where expectations are taken over individuals. In contrast, we have been interested in understanding variability among (hypothetical) replicate populations in population outcomes, typically a per-capita outcome such as $Y = \frac{1}{n}\sum_{i=1}^n X_i$. Thus, we calculate $M_2 = E[\frac{1}{n}\sum_{i=1}^n X_i]$ and $V_2 = E[(\frac{1}{n}\sum_{i=1}^n X_i - M_2)^2]$. Note that $M_1 = M_2$, but that the variances will be different if the $X_i$ are correlated, because of all the terms in $X_i X_j$ in $E[Y^2]$.

$V_1$ is observable in any population, whereas $V_2$ is observable only with experimentally controlled replicates. Thus, $V_1$ will appeal to empiricists. However, it is $V_2$ that affects estimates of extinction risk (e.g.) in population projections. For wild populations, it is a theoretical construct; it can be estimated from data only by making assumptions about distributional forms, and is not directly observable. [An aside: I'm not sure that issues of estimation error of $V_2$ from finite datasets has been addressed.]

There is still an impact of correlations on what Hal is interested in, which is that correlations will mean that the standard error of $M_1$ will not be $\sqrt{V_1/n}$ (in the extreme case of exactly half having survival 1 and half having survival 0, there is no sampling error in the empirical estimate of mean survival). 

So what to do with this? The stochasticity--heterogeneity variance decomposition can still be applied to $Y$ (although it will be a more complex calculation), allowing us to explicitly document the effects of positive and negative correlations among individuals in their heterogeneity class. It could even allow us to look at correlations among *stochastic outcomes* (e.g., calf can't survive if its mother dies), or between heterogeneity class and stochastic outcomes (e.g., in a rank-order hierarchy, your rank improves as higher-ranked individuals die). But because the results are mostly interesting in the context of demographic stochasticity, I think the focus would be on annual vital rates (what is the point in looking at the variance in per-capita longevity?).

I suppose one new direction might be looking at how heterogeneity in within-year processes (e.g., instantaneous mortality hazard) translates into annual stochasticity (might be most interesting if there are dependencies in the stochastic part).

It is probably still worth identifying the interaction between heterogeneity and stochasticity, as written up in the main ms; this doesn't require treatment of correlations. It will mean that we need to invite Hal and members of his group to contribute as they haven't published the initial idea about the decomposition yet. One thing this could do is let us identify situations where heterogeneity reduces the among-individual variance (basically, it will require $V_D'' < -2$, although there could be contributions from higher moments/derivatives). I'm not sure that there will be any relevant stochastic processes for which this condition applies though; and certainly the LRS statistics that Hal and Tulja focus on will not be there, as they are dominated by the exponential-like distributions of longevity.

None of this invalidates the criticisms of "individual stochasticiy" as a null model for identifying fixed heterogeneity, which are twofold: Low power (because of a large SE for the observed variance of an exponential process) and variance inflation if the Morkovian assumption is violated.

# Notation

- $X_i$ is the outcome of a stochastic process for individual $i$. It might be survival (or not); number of offspring from a reproductive bout; life span; lifetime reproductive success; etc.
- $X_i$ is distributed according to a pdf (or pmf, for discrete distributions) $f(X|\boldsymbol{\theta_i})$, where $\boldsymbol{\theta_i}$ is a vector of parameters specific to individual $i$. For the rest of this discourse, we will assume for simplicity that only one parameter varies among individuals, which we denote as the scalar $\theta_i$.
- $f(X|\theta_i)$ has mean $M_D(\theta_i)$ and variance $V_D(\theta_i)$. The $D$ subscript indicates that this is a mean and variance over demographic stochasticity.
- $\theta_i$ is distributed according to a pdf (or pmf, for discrete distributions) $g(\theta)$, which has mean $M_{\theta}$ and variance $V_{\theta}$.
- The mean and variance of outcomes across the $n$ individuals in a biological population or statistical sample are $M_X = E\left[\frac{1}{n} \sum_{i=1}^n X_i \right]$ and $V_X = E\left[\frac{1}{n} \sum_{i=1}^n \left(X_i - M_X\right)^2 \right]$.
- Derivatives with respect to $\theta$ are indicated with primes: e.g., $V_D'' = \frac{d^2 V_D}{d \theta^2}$.

# Examples
We will use several examples to illustrate the analysis. They are:

1. An individual's survival over a discrete time interval, which is Bernoulli distributed with parameter $\theta_i = p_i$. This gives $M_D(\theta_i) = p_i$ and $V_D(\theta_i) = p_i \left(1 - p_i \right)$.
2. Number of offspring produced by an individual during a reproductive bout, assumed to be Poisson distributed with parameter $\theta_i = \lambda_i$. This gives $M_D(\theta_i) = \lambda_i$ and $V_D(\theta_i) = \lambda_i$.
3. Lifespan of an individual with age-independent mortality rate $\mu_i$, which is exponentially distributed with parameter $\theta_i = \mu_i$. This gives $M_D(\theta_i) = \frac{1}{\mu_i}$ and $V_D(\theta_i) = \frac{1}{\mu_i^2}$.

# Analysis
We write $X_i = M_D(\theta_i) + d_i$, where $d_i$ has mean zero and variance $V_D(\theta_i)$. $d_i$ and $\theta_i$ are uncorrelated, so 
\begin{equation}
M_X = E\left[M_D \right]
\end{equation}
and 
\begin{equation}
V_X = E\left[\left(M_D(\theta_i) - M_D(M_{\theta})\right)^2\right] + E\left[V_D(\theta_i)\right],
\end{equation}
where the expectations are over $g(\theta)$.
