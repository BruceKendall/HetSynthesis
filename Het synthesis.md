---
author: 
    - Bruce E. Kendall
    - Gordon A. Fox, Tim Coulson
output: pdf_document
---
# Introduction
<Stream of consciousness from a talk>

Heterogeneity among individuals within a population is a ubiquitous phenomenon. Some of that heterogeneity is related to ontogeny: in most species, adults are larger than juveniles, and in metamorphic species that don't follow that pattern, juveniles and adults have qualitatively different morphologies, physiologies, and behaviors. Even controlling for developmental stage, however, we often see substantial variation in traits such as size, color, feeding preferences, and behavior. Some of this variation is caused by genetic differences: for example, coat color variation in wolves is caused by a single-locus polymorphism, and many continuous traits are controlled by a suite of genes. Our mechanistic understanding of how genes determine phenotypes is rapidly growing, at least for a set of model organisms. Other variation is caused by heterogeneity in the environment. Some pine forests on Long Island in New York state are dwarfed; this turns out to be entirely caused by unusual soil characteristics. Such spatial environmental heterogeneity can occur at a wide range of scales: in south Florida, elevational differences of 10s of centimeters result in drastically different water availability, such that neighboring trees can be experiencing very different environments. Behavioral variation may reflect heterogeneity in the social environment, as in the cultural inheritance of song dialects in some birds.

The causes and consequences of trait heterogeneity at all scales are the central motivations of evolutionary biology, and within-population heterogeneity, when it affects individual fitness, is the focus of population and quantitative genetics. Historically, ecologists focused on variation at higher levels, viewing individual variation as "noise." About 15 years ago, Gordon Fox and I started asking whether such heterogeneity could affect population dynamics. The topic has become somewhat trendy, with questions being asked about effects on communities as well as populations, but we are still in a stage dominated by speculation and contention. Some of this is because the theory has not been thoroughly worked out, and in my talk I'll try to develop some clarity there. But there are also empirical challenges, which I want to briefly touch on.

So far, I've been talking about traits that are easy to observe, such as size, color, and behavior. But for variation in such traits to impact population dynamics or evolution, they must affect affect demography---births and deaths---also sometimes called fitness traits. We can observe an individual's realized demography---how many offspring it had, whether it died---but we are really interested in its underlying demographic propensities: the expected offspring number, and its mortality hazard, or probability of dying. We can estimate how these rates are correlated with observed traits, of course, but they are often also affected by unobserved individual characteristics, some of which are fundamentally unobservable in free-living populations. The effects of such "latent" variability on demography are challenging to estimate, especially as they affect mortality risk. Ideas about how best to do this estimation are still evolving, and much contention derives from the fact that different approaches reach different conclusions.

OK, back to theory. I am going to be focusing on ecological effects, especially population dynamics, as that is the area I know best and have done most research on. As such, I am going to be taking the level of heterogeneity as given, and not worry about what maintains the variation in the face of, say, selection on additive genetic variance. But if you're an evolutionary biologist, you can think about how these effects change the context within which selection occurs, and how that might feed back on evolutionary change. I'll touch on that explicitly near the end of my talk.

</Stream of consciousness from a talk> [EDIT DOWN THE ABOVE]

Functional traits


Vindenes & Langangen (2015) classify "traits" as "dynamic" and "static". They do not explicitly define "trait" but seem to use it refer to characteristics (mostly measurable) that affect fitness

- Dynamic traits "are changing over the lifetime, randomly or non-randomly": 
    - age, size, stage, spatial location (mobile organism), body condition, social status

- Static traits "remain the same over the lifetime of an individual, or represent events that occur only once and have a lasting impact on the individual life history.": 
    - Initial size, natal habitat, personality, genotype, sex, natal habitat/environment, birth date, spatial location (sessile organism), habitat

Notes:

- The listed dynamic traits are what we commonly think about as "state"
- "Habitat" need not be static
- In the context of thinking about traits as being autocorrelated within an individual, a static trait is just one with $\rho = 1$.

V&L use the term "individual heterogeneity" to refer to population that is structured by *either* dynamic or static traits. (p. 423)

Tuljapurkar et al. (2009) define the following for stage-structured Markov models (pp. 93-4):

- *Dynamic heterogeneity*: "life-history differences among individuals that are generated by the stochastic process that describes changes in stage"
- *Fixed heterogeneity*: "differences between individuals that are fixed at birth"

This is motivated by work in multi-stratum CMR models, in which fixed heterogeneity is estimated/identified using random effect terms. The "amount" of demographic heterogeneity is described by an entropy, which assesses the diversity of possible life-history trajectories, weighted by their probability of occurring. 

Caswell (2009) simultaneously used the term "individual stochasticity" to describe the process called dynamic heterogeneity by Tulja; he focuses on the resulting variance in life history parameters rather than a quantification of the number of trajectories. Steiner & Tulja later called this "neutral heterogeneity," reflecting the fact that the variation among individuals in realized LRS is not associated with any variation in fitness (expected LRS).

Why does heterogeneity matter? There are two reasons (Vindenes). First, heterogeneous populations may have fundamentally different properties or dynamics from homogeneous ones. Second, if a population is heterogeneous but we model it as homogeneous, then our estimates of certain populations characteristics and future dynamics may be biased, depending on the nature of the heterogeneity, the state of the population, and the characteristics of interest.

What we're doing in this paper:

- Bring together trait perspective with demographic heterogeneity perspective
- Show how trait correlations within and among individuals are key for understanding how and whether variation affects populations, through links with natural and cohort selection
- Show that "fixed heterogeneity" and "dynamic heterogeneity" (aka neutral heterogeneity, individual stochasticity) are special cases of a rich spectrum
- Unpack the hidden assumptions of "individual stochasticity" and its use as a null model
- Introduce the notion of "ontogenetic variability" (for which individual stochasticity is one special [but commonly modeled] case), and show how it induces autocorrelated traits even in the absence of "fixed" heterogeneity

# Heterogeneity and selection
If a population exhibits heterogeneity in functional traits, then it may have a distribution of fitnesses across individuals (following Steiner & Tulja, we reserve the word "fitness" for *expected* outcomes; for an individual's *realized* outcome we use "fitness component"). The role of static trait heterogeneity in creating a fitness distribution is clear; for dynamic traits the  key question is whether an individual's initial trait value predicts its expected trait value, averaged over its lifetime. In general, this will require positive autocorrelation in the trait over the individual's life, with larger autocorrelation coefficients resulting in a stronger association between initial trait value and individual fitness. Indeed, a static trait can be equated to the limiting case of a dynamic trait with an autocorrelation of one. Thus, we conjecture that *for trait heterogeneity to create fitness differences among individuals, traits must be positively autocorrelated within individuals.* [DO WE WANT TO TRY TO PROVE THIS?]

To understand how these fitness differences translate into evolutionary and ecological dynamics, we need to understand the feedback from fitness differences to changes in trait distributions. There are two such feedback processes: natural selection and cohort selection. We start by examining the conceptually simpler case of directional selection, where the relationship between the trait value and fitness is monotonic.

Under natural selection, more fit individuals leave, on average, more offspring in the next generation. If offspring traits are positively correlated with parent traits, then the mean trait in the offspring generation will be higher than it was in the parent generation. Such parent--offspring correlations may arise from genetic mechanisms, shared environments, or parental effects. This leads to changes in the trait distribution over evolutionary time that could affect the population's ecological dynamics (e.g., population growth rate). These changes would not occur in the absence of either suitable (i.e., correlated within individuals) heterogeneity (which creates the opportunity for selection) or parent offspring correlations (which create the response to selection). Likewise, failing to incorporate either of these processes in a model of a population that has them will lead to incorrect predictions of many ecological and evolutionary outcomes. 

Cohort selection is a somewhat subtler phenomenon (it is also confusingly named, because it refers *both* to the selection and the ecological response to selection). If some individuals in a cohort have traits that give them consistently higher-than-average annual survival (or consistently lower-than-average instantaneous mortality), then as the cohort ages the trait distribution within the cohort will predictably shift towards the values that give higher survival. As a result, mean survival will increase with age, above and beyond any age-specific survival patterns associated with the mean trait at birth (Vaupel etc.). Compared with a population that has no heterogeneity, cohort selection increases the density-independent population growth rate and can increase density-dependent equilibrium abundances (Kendall2011, Stover). If the population is at its stable trait distribution, then ignoring such heterogeneity will not bias the estimate of $\lambda$, but will lead to incorrect estimates of some life-history characteristics (Vindenes). Furthermore, ignoring this heterogeneity will create problems if the population is away from the stable trait distribution, as will be common in a fluctuating environment.

Cohort selection is usually expressed in terms of so-called frailty models, in which an individual's frailty is its hazard deviation from the age-specific hazard of the mean frailty at birth. Such frailties are assumed to be constant through an individual's lifetime, and can be estimated even if no measured trait is associated with frailty. This assumption of perfect within-individual autocorrelation is essential for the trait-free estimation; but in many cases individuals may exhibit trait autocorrelation less than one. It is possible to show that this still results in cohort selection, albeit in a weaker form. [DERIVE THIS RESULT IN A SIMPLE MODEL]

Within-individual correlations in traits that affect survival lead to cohort selection; the same is *not* true for traits that affect fertility. Individuals with consistently higher than average fertility produce more offspring, but they do not increase in frequency within the cohort as the cohort ages. Unless the fertility traits are correlated with the survival traits, a cohort's fertility distribution is set by the distribution of traits at birth, and in particular a cohort's mean fertility simply follows the age-specific trajectory associated with the mean trait at birth. 

Thus, whereas autocorrelated traits that affect either fertility or survival can lead to changes in trait distributions *across* generations (if there is a parent--offspring correlation), only autocorrelated traits that affect survival can lead to changes in trait distributions *within* generations. Uncorrelated dynamic traits lead to no change in either case.

# Ontogenetic variability
Some functional traits (such as body size and degree of reproductive maturity, as well as more dramatic trait changes associated with metamorphosis) change in a predictable way through ontogenetic development. If all individuals develop at the same rate, then this trait change, and the associated changes of fitness, can be captured in an age-structured model. However, it is commonly the case that individuals do *not* all develop at the same rate: perhaps they experience different environments, obtain different amounts of resource, or differ in other traits that affect development. [IS THERE AN ANALOG TO "FUNCTIONAL TRAITS" FOR THIS?] We call this "ontogenetic variability." In either case, there will be a distribution of trait values within the population, representing the distribution of ages; but with ontogenetic variability, there will also be a distribution of trait values among individuals *of the same age*.

"Individual stochasticity" and the null model for variation in LRS, longevity, etc.

Above we highlighted the importance of within-individual correlations for understanding the extent to which heterogeneity in functional traits affects a population's dynamics and life-history characteristics. Many ontogenetic traits are non-stationary (they move in a consistent direction throughout an individual's life), so it can be useful to look instead at age-standardized traits---the deviation of an individual's trait value from the mean trait at age. In particular, if survival is monotonically related to the trait, then the extent to which ontogenetic variability will lead to cohort selection will depend on the extent to which age-standardized traits are autocorrelated within individuals.

To see how this might work, consider body size as a trait; this is commonly positively associated with survival and fertility. Integral projection models (IPMs) are powerful tools for projecting populations with continuous size distributions (as well as other traits). Such models commonly assume that growth at size is probabilistic---that is, each individual draws its subsequent size from a distribution with a size-specific mean and variance; in the absence of additional traits in the model, each individual at a given size draws its growth independently of other individuals, and independently of its past growth rate. Thus, there is no individual autocorrelation in growth rate. However, if an individual is larger than average for its age at time $t$, then it will also be larger than average for its age at time $t+1$. [MAKE FIGURE ILLUSTRATING THIS, AND DO THE MATH AS WELL, FOR A SIMPLE GROWTH FUNCTION] A similar phenomenon occurs with qualitative developmental stages: if an individual is precocious for its age now, it will have a better than average chance of being precocious for its age in the near future.

Thus, even if all of the variation in size-specific growth (or stage-specific development) is effectively stochastic (iid among individuals, with no persistent traits affecting them), this stochastic developmental variability will induce positive autocorrelations in individuals' age-standardized ontogenetic traits. If these traits affect survival, then cohort selection will result, and the effects on population statistics such as population growth rate and mean longevity will probably be increasing in the amount of ontogenetic variability.

Some species exhibit actual autocorrelations in size-specific growth rate. DESCRIBE PFISTER'S WORK ON TREES. This will further strengthen the autocorrelation in age-standardized size, increasing the opportunities for cohort selection. These growth autocorrelations presumably reflect autocorrelation in one or more individual traits, or in the individual's environment; thus, we can see that positive autocorrelations in developmental traits, just like those in functional traits, increase the potential for individual heterogeneity to impact populations.

However, developmental trait correlations need not be positive. Examples: energetic tradeoffs; age within stage. For the latter, failure to recognize the within-stage heterogeneity and applying the standard Markovian assumption of stage-structured matrix models will lead to an *overestimate* of ontogenetic variability, and will thus predict a greater variance in life-history statistics than is actually exhibited by the population.

# Heterogeneity and stochasticity 
Notes on a chat with Hal Caswell and a few of his group: [Nienke Hartemink](http://ibed.uva.nl/research/research-groups/content/theoretical-ecology/staff/staff/staff/cpitem-10/link/n.a.hartemink) (postdoc), [Lotte de Vries](http://ibed.uva.nl/research/research-groups/content/theoretical-ecology/staff/staff/staff/cpitem-23/link/c.devries) (PhD student), and a third person who's name I didn't get and I can't find on the website.


The focus was on my question of an interaction between "heterogeneity" and "stochasticity"---Nienke had just given a seminar showing that variance in longevity could be partitioned into these two components, and I asked how heterogeneity affects the stochastic variance.

## Variance of mixture distributions
In the discussion we focused on mixture distributions. In this case, the total variance can be written (for a discrete number of heterogeneity classes) as

$$V_{tot}(X) = E[V_p(X)] + V(E_p[X]),$$

where $V$ is variance, and $E_p$ and $V_p$ are the mean and variance at parameter value $p$. Later we will denote the probability that an individual is in probability group $i$ as $\pi_i$. Note that everything that follows easily extends to continuous heterogeneity distributions.

Hal identifies the first component as the "stochastic variance" and the second as the "heterogeneity variance." This can be calculated (once you know the mean and variance of the $p$'s) for a given dataset; my question is, how does changing the heterogeneity distribution (e.g., increasing $V(p)$) change the stochastic variance.

We start with some simple examples, where $E_p[X] = p$. First a Bernoulli process, where $V_p(X) = p(1-p)$. In that case,

$$\begin{aligned}
E[V_p(X)] &= \sum_i \pi_i V_{p_i}(X)\\
&= \sum_i \pi_i p_i (1-p_i)\\
&= E[p] - E[p^2]\\
&= \left(E[p] - E[p]^2 \right) - \left(E[p^2] - E[p]^2\right)\\
&= E[p] - E[p]^2 - V(p)\\
&= V_{E[p]}(X) - V(p);\\
V(E[X]) &= V(p). 
\end{aligned}$$
In this case $V_{tot}(X)$ is independent of $V(p)$, but increasing heterogeneity shifts the variance from the stochastic component to the heterogeneity component.

I think it can sometimes be useful to think about the quantity $E[V_p(X)] - V_{E[p]}(X)$, which is the change in the stochastic variance, *relative to a homogenous population with the same mean,* that is caused by heterogeneity; if we call this $I(V(p))$ then we can write

$$V_{tot}(X) = V_{E[p]}(X) + V\left(E_p[X]\right) + I(V(p)),$$

and for the Bernoulli distribution $I(V(p)) = - V(p)$. **[I am open to notational suggestions!]**

Second, we look at the Poisson distribution, where again $E_p[X] = p$ but $V_p(X) = p$. Here it is easy to show that  $E[V_p(X)] = V_{E[p]}(X)$, so $I(V(p)) = 0$.

[Talk about the Taylor series expansion.]

Now let's look at a somewhat more complex case: the exponential distribution. For example, $p$ could be age-independent annual mortality, which varies among individuals but each individual keeps its $p_i$ throughout life; we then are interested in the variance of longevity. Here, $E_p[X] = 1/p$ and $V_p(X) = 1/p^2$. Thus the heterogeneity variance is $V(1/p)$ and the stochasticity variance is $E[1/p^2]$; the latter is the harmonic mean of $p^2$ and thus will be larger than $V_{E[p]}(X) = 1/E[p]^2$. Note that heterogeneity in $p$ affects the mean longevity as well as the variance in longevity. 

The second-order Taylor series approximation gives us

$$
E[1/p^2]  \approx \frac{1}{E[p]^2} + \frac{3}{E[p]^4} V(p)
$$
so that the interaction is 

$$I(V(p)) \approx \frac{3}{E[p]^4} V(p).$$

The heterogeneity variance is

$$\begin{aligned}
V(1/p) &= E[(1/p - E[1/p])^2]\\
&= E[1/p^2] - E[1/p]^2\\
&\approx \frac{1}{E[p]^2} + \frac{3}{E[p]^4} V(p) - \left(\frac{1}{E[p]} + \frac{1}{E[p]^3} V(p) \right)^2\\
&= \frac{1}{E[p]^4} V(p) - \frac{1}{E[p]^6} V(p)^2\\
&= \frac{V(p)}{E[p]^4} \left(1 - \frac{V(p)}{E[p]^2} \right)
\end{aligned}$$

Thus, the heterogeneity variance can be as low as zero (if $E[p] = 0.5$ and $V(p) = 0.25$) and is always smaller than the interaction between heterogeneity and stochasticity.

## Correlations among individuals
The above calculation applies to a (biological) population of $N$ individuals only if each individual's heterogeneity class is in iid draw from the heterogeneity distribution. If the individuals are not iid, then the total variance calculation (e.g., for the fraction of the $N$ individuals that survive, or for the longevity across the $N$ individuals in a cohort) needs to include a covariance term to represent the co-occurrence of individuals across heterogeneity classes.

[Write out the math of this explicitly. Reference and use Engen's "demographic covariance"]

In general, this covariance will be situation-specific, but there are a few ecologically relevant limiting cases that we can evaluate explicitly.

1. If family members are more likely than average to share a heterogeneity class (because of shared environment or shared genes), then the covariance term will be positive; if all families are of size $n$ and all individuals within a family always have the same heterogeneity class, then the covariance will be $(n-1) V(p)$.
2. Negative correlations among siblings (e.g., because of unequal resource provision by the parents) will lead to a negative covariance.
3. If the assignment of individuals to heterogeneity classes is deterministic (e.g., if the heterogeneity is due to spatial variation in environmental quality, and individuals are hyperdispersed in space) such that the number of individuals in each heterogeneity class is exactly $N \pi_i$, then the covariance is $- V(p)$, completely canceling the heterogeneity variance.



Relate this to Vindenes' estimate of the demographic variance under het

# Discussion