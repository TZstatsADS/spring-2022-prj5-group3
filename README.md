# Project 5: Animedia -- Animation Trending and Recommendation APP

## Overview
#####
By developing this Shiny app, we aim to provide a smooth experience for beginners to find their favorite animes, and some exploraion choices for anime experts to find more interesting animes. We decide to implemented three functions: Anime trending and search, random anime recommendation, as well as a tuned recommendation system that looks for anime that people with similar interests like.

- Introduction
  - Anime Trending: In this section, the customer could navigate through the anime database that are sorted by score, popularity, favorites and watching status, and get to see what anime fans are interested in! Follow the pace of other anime fans and find the most popular and highly rated anime!  <img width="1909" alt="image" src="https://user-images.githubusercontent.com/45897080/165629167-988ab221-7bb8-4a2b-9b05-970c88fa36a1.png">

  - Anime Search: In this section, the customer could find a more tuned list by choosing some specific favorite type and genre, and see what are the top rated anime! <img width="1917" alt="image" src="https://user-images.githubusercontent.com/45897080/165626987-ad1907e3-f876-4949-808c-1d7d309e261f.png">

- Grab a random anime!
  - In this section, the customers could enter the type and genre. The system will randomly find three top-rated anime for each person! They are specifically found for individuals，which may increase the curiosity and interest of customers on this website and their search for anime <img width="1902" alt="image" src="https://user-images.githubusercontent.com/45897080/165627287-0087f7a9-5c89-4ce1-b172-e4e2dd6645b1.png">

- Recommendation
  - Our goal is to give our customer a recommendation list knowing one or two of the customer's favorite animes. We use the language model to assign a probability to a piece of each anime's name. In our daily life, language models are often used in typing software and web pages to predict the next word or paragraph of words. 
  - We select 4000 users' favorite lists which contain anime lists sorted by time and popularity. We treat each anime name as a word and use Markov Assumption to infer the relationship between animes. We apply bigrams and trigrams models to give the customers a choice of writing down one or two anime they like. Our tab will return a list of anime ordered by probability and popularity. These are the animes users put in their favorite lists after the anime the customer typed in. <img width="1891" alt="image" src="https://user-images.githubusercontent.com/45897080/165627362-ed528f94-4ea4-4152-8f9f-73f8eac4e148.png">



# Project title: Animedia -- Animation Trending and Recommendation APP
Term: Spring 2022
+ Team #3
+ Team members
    + Tang, Kexin
    + Wang, Kaimin
    + Qian, Weixun
    + Zheng, Haozhong
+ **Shiny Link**: https://tonyz.shinyapps.io/animedia/
+ [Contribution Statement] Kexin, Kaimin, Weixun, and Haozhong all contributed to the planning and ideas phase of the project. Kexin first implemented the shiny design including the Homepage and every team member implemented the About page. Kexin and Haozhong created the Information tab. Kaimin created the Recommendation tab and implemented the anime recommendation component using natural language processing language models. Weixun implemented the random anime page, and Haozhong implemented the anime theme picture function that greatly enriches the content. Kaimin initially updated the README and was later developed by Weixun. Each person added the description of their tab. Kexin is the presenter. Haozhong packaged and uploaded the file to shiny Rstudio cloud. 

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is organized as follows.

```
proj/
├── app/
├── lib/
├── data/
└── doc/
```

Please see each subfolder for a README file.
