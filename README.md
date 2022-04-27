# Project 5: Animedia -- Animation Trending and Recommendation APP

## Overview
#####



- Introduction
	+ Anime Trending #####
	+ Anime Search #####
- Recommendation
	+ Our goal is to give our customer a recommendation list knowing one or two of the customer's favorite animes. We use the language model to assign a probability to a piece of each anime's name. In our daily life, language models are often used in typing software and web pages to predict the next word or paragraph of words. 
	+ We select 4000 users' favorite lists which contain anime lists sorted by time and popularity. We treat each anime name as a word and use Markov Assumption to infer the relationship between animes. We apply bigrams and trigrams models to give the customers a choice of writing down one or two anime they like. Our tab will return a list of anime ordered by probability and popularity. These are the animes users put in their favorite lists after the anime the customer typed in.   



# Project title: Animedia -- Animation Trending and Recommendation APP
Term: Spring 2022
+ Team #3
+ Team members
    + Tang, Kexin
    + Wang, Kaimin
    + Qian, Weixun
    + Zheng, Haozhong
+ **Shiny Link**: #####
+ [Contribution Statement] Kexin, Kaimin, Weixun, and Haozhong all contributed to the planning and ideas phase of the project. Kexin first implemented the shiny design including the Homepage and every team member implemented the About page. Kexin and Haozhong created the Information tab. Kaimin created the Recommendation tab. Kaimin initially updated the README and was later developed by #### modified the content. Each person added the description of their tab. Kexin is the presenter. #### packaged and uploaded the file to shiny Rstudio cloud. 

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is organized as follows.

```
proj/
├── app/
├── lib/
├── data/
└── doc/
```

Please see each subfolder for a README file.
