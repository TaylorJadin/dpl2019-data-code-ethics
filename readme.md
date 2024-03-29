# Notes

[website for track - dpl.pushpullfork.com](https://dpl.pushpullfork.com)

[R for Data Science book](https://r4ds.had.co.nz/)

[R cheat sheets](https://www.rstudio.com/resources/cheatsheets/)

## Monday

[cool intro activity](https://kshaffer.github.io/dplintros/)

### Representation

[domains modules, we specifically used the representation one](https://umw.domains/modules)

Input + Content --> Algo (black box) --> Output

What is the output? 

Representation:
 - Unconscious bias
   - developers
   - users
   - other users

Older conceptions <--> Stereotypes

**Engagement is easy to count and measure. So it is often used to measure the success of the algorithm.** 

![feedback loop of human-algorithm interaction](images/photo.jpeg)

[Who does Google think I am?](https://adssettings.google.com/authenticated) - Might be interesting activity for digciz tutorial

Without a check in the code, the algorithm's version of reality will radicalize beyond the hard-coded reality and the stereotype because of the loop.

If you click things that you feel are more just you can positively impact this loop.

Checks in the code could be what text is extracted around the image to improve results.

#### How do we hack/influence the model?
  - media creation
  - open content
  - reporting on the platform (sorta works, but moderators lack context)
  - Activism - public pressure, legislative pressure
  - educate 
  - deliberate consumption
  - self-examination

## Tuesday

[Kumu](https://kumu.io) for mapping

Mapping activity about data, what does your  bank know about you? (ex: Phone, Income, SSN) and what other companies know this stuff

![](images/photo-2.jpeg)

DatDA
  - legal action (if you have the resources)
  - legislative pressure
  - educate
  - gather info (Terms of Service, Privacy policies), use something like [Diffchecker](https://www.diffchecker.com/)
  - OS
  - browser
  - public pressure
    - on lawmakers
    - on companies
  - data cleanups
  - pw managers
  - diff emails, or + email addresses (myemail@gmail.com myemail+bestbuy@gmail.com), or adding periods in gmail addresses
  - separation of accounts or maybe devices
  - VPN or TOR, use a reputable VPN service that costs money
  - deleting apps

Trust Compression (from [@holden](https://twitter.com/holden))

![](images/photo-3.jpeg)

We tend to lump together the 50% trustworthy things with things near the bottom of the scale

DigDetox
 - how many apps on your phone? 166
 - how many have you used in the last 7 days? 73 44%
 - how many apps do you know how they use your data? 
 
Privacy vs. Secret
 - root of privacy is privy, who do you tell things?

# importing data
`name <- read_csv('somefile.csv')`
use `read_csv` for the tidyverse way of doing things, gets us tibbles instead of tables

`colnames(name)` gives you just the column names of data you have imported

[web scraping package to check out at some point](https://blog.rstudio.com/2014/11/24/rvest-easy-web-scraping-with-r/)

## Wednesday

### Ed-tech algorithms and critiquing big-data marking hype

[presentation link](https://kshaffer.github.io/edtechalgorithms)

Data Science is Data Science
  - when edtech companies talk about proprietary stuff they are really talking about a creative arrangement of stuff that the data science world is already using

More data beats a better algorithm
  - a fundamental problem in data science, sometimes we start with very little data
  - more real data beats a creative algorithm
  
Machine learning
  - applied statistics
  - algorithmic analysis to make better predictions
  
|                | Classification | Regression |
| -------------- | -------------- | ---------- |
| Supervised     |                |            |
| Unsupervised   |                |            |

Categorical vs. Continuous
  - continuous data has a scale
    - weight, height
  - categorical can't be measured on a scale
    - hair color, what team does someone play on 
    
Classification vs Regression algorithms
  - Classification is an algorithm most often used for categorical
  - Regression algorithms give use continuous data
  
Supervised vs Unsupervised
  - supervised learning = both data and outcomes are known, the algorithms are just for relationships
    - you have some data where you known the outcome, and some where you don't so you use the known outcomes to train the model to predict the outcomes
    - supervised is more common, its also easier to demonstrate it was successful
  - unsupervised learning = we know the data, but outcomes and relationships are emergent
    - harder to do, harder to know you got it right especially at first
    
Correlation = two parameters of data for the same observations, do they go together?
  - ex: Is there a relationship between number of dogs owned and annual vacuum filter purchases?

[CrossValidated is great for statistics questions](https://stacks.stackexchange.com)

Chi-Squared Test = comparing two stgreams of categorical data
  - ex: is there a relationship between house architecture and selling price?
  
Anova (Analysis of Variance) = comparing a stream of categorical data with a stream of continous data
  - ex: is there a relatinoship between house architecture and selling price?

#### Supervised Regression Algorithms
*Note: check the presentation for helpful images*

Linear regression = what is the relationship between contibuting facgtor(s) and a continous data result?
  - what is the impact of home size and age on sale price?

Logistic regression = what is the relationship between contributing factors and a categorical result?
  - do calorie intake and fat intake contribue to heart attacks?
  
#### Supervised classification algorithms
How do specific features influence classification? How can that information be used to classify new observations?
  - Ex.: Voice recognition, OCR, face detection.

K-Nearest Neighbor
  - computationally cheap

Decision Tree

Random Forest

Neural Networks
  - when you hear about a black box that even data scientists don't know what is going on, this is probably what they are talking about, DS's know how it works, but its something a human couldn't do with a pencil paper and calculator and an unlimited amount of time

#### Unsupervised classification algorithms
Given a known set of features, what kinds of classifications emerge from the data?
  - ex: recommendation systems
  
Topic Modeling

Cluster Analysis

#### Sequential Models
Given an event or sequence of events, what is the likelihood that a particular event will happen next?

Markov Models

#### Exploration of [Knewton Adaptive Learning](https://cdn.tc-library.org/Edlab/Knewton-adaptive-learning-white-paper-1.pdf)

  - is it classification or regression?
    - mostly classification, which means its putting students into categories across all students in the system, so the personalization of the learning might actually be less personalized if you wrote questions for a class of 32 students
  - is it supervised or unsupervised?
  - what are the data sources/features?
  - what are the predicted ouputs?
  - what is the pedagogical intention?
  
## Thursday

### Computational Agency and Ethical Ed-tech

Tech is not inherently good.
Tech is not inherently bad.
Tech is not inherently neutral.

Path of least resistance <--> "frictionless design"
[Relevant article: Is Tech Too Easy to Use?](https://www.nytimes.com/2018/12/12/technology/tech-friction-frictionless.html)

Apps/Websites are designed for frictionless use of the features that THEY want you to use, not necessarily what the user naturally would want first. This is new to product design. When their business interests are not aligned with the interests of the user that could cause problems.

### [Algorithmic Harms Beyond Facebook and Google: Emergent Challenges of Computational Agency](http://ctlj.colorado.edu/wp-content/uploads/2015/08/Tufekci-final.pdf)

You can combine a few pieces of seeming neutral data which then become stand-ins for things that we would normally consider discriminatory.

#### recommendations

[I Am Jane Doe](https://www.netflix.com/title/80167459)

[Active Measures](https://www.imdb.com/title/tt8135494/)

**Lack of ethical imagination can be as dangerous as malicious intent.**

[Symphony for the City of the Dead](https://www.amazon.com/Symphony-City-Dead-Shostakovich-Leningrad/dp/1531863183)

[Feed](https://www.amazon.com/Feed-M-T-Anderson/dp/0763662623)

[Ethical EdTech Wiki](https://ethicaledtech.info/wiki/Meta:Welcome_to_Ethical_EdTech)
## Friday

### an unordered list of cool stuff from presentations
 - R package for text: [tidytext](https://www.tidytextmining.com/)
 - R package for working with dates: [https://lubridate.tidyverse.org/](https://lubridate.tidyverse.org/)
 - [insult generator](http://kshaffer.github.io/insults/)
 - [shiny apps](https://shiny.rstudio.com/)
 - [Wiring Pi](http://wiringpi.com/)
 - [Daily free books from Pact Publishing](https://www.packtpub.com/free-learning)
 - [Humble Bundle Data Analysis Bundle](https://www.humblebundle.com/books/data-analysis-machine-learning-books?hmb_source=navbar&hmb_medium=product_tile&hmb_campaign=tile_index_4)
 
### Takeaways
  - privacy policies and terms of service
    - look for boilerplate paragraphs or sentences to see where they have put intentional thought or where they have specific needs
  - [Grooming Students for a Lifetime of Surveillance](https://modelviewculture.com/pieces/grooming-students-for-a-lifetime-of-surveillance)
    - expectations of privacy and agency can erode over time
