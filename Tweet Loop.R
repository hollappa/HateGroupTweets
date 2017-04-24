library(twitteR)
library(ROAuth)
library(httr)
library(ggplot2)
library(tm)
library(reshape2)

setwd("C:/Users/hollappa/Desktop/McCourt School of Public Policy/Intro to Data Science/Project")

# Set API Keys
api_key <- "df8kmMPkUQpzmrlMpmsnJVRbe"
api_secret <- "3SXsrdVPO0HNzI9FRxyRtMi4Zp3LearzGkQpiujIw0fmJvLMmH"
access_token <- "49495376-HdwfsoritCfe6u7NP0SBFPQSRYLJf44reBpg1wfGz"
access_token_secret <- "p5g1HsJKRYzLYhp7nvzt2ih72PUGr8x32BDKf5Sy47LPM"
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

twitter_accounts <- read.csv("handles_test.csv") 
twitter_handles <- twitter_accounts$handle
twitter_id <- twitter_accounts$number

masterfile <- data.frame()

twitter_handles <- as.character (twitter_handles)

for(i in 1:length(twitter_handles)) {
  tweets<-searchTwitter(twitter_handles[i], n=1500)
  tweets1 <- lapply(tweets, function(t) t$getText())
  tweets_melt<- melt(tweets1)
  masterfile <- rbind.data.frame(masterfile, tweets_melt)
}

