#Problem statement.
#Recommend a best book based on the author, publisher and ratings.


#Installing and loading the libraries
install.packages("recommenderlab", dependencies=TRUE)
#install.packages("Matrix")
library("recommenderlab")
library(caTools)
library(Matrix)

#Book Dataset
book_data <- read.csv("C:\\Excelr Data\\Assignments\\Recommendation System\\book.csv")
View(book_data)

class(book_data)

# Droping First column
book <- book_data[-1]

View(book)

#metadata about the variable
str(book)
table(book$Book.Title)

table(book$Book.Rating)


#rating distribution
hist(book$Book.Rating)


#the datatype should be realRatingMatrix inorder to build recommendation engine
book_matrix <- as(book, 'realRatingMatrix')
book_matrix


#Popularity based 
book_recomm_model1 <- Recommender(book_matrix, method="POPULAR")
book_recomm_model1 


#Predictions for two users 
recommended_items1 <- predict(book_recomm_model1, book_matrix[100:150], n=5)
as(recommended_items1, "list")
recommended_items1


## Popularity model recommends the same book for all users , we need to improve our model
#using # # Collaborative Filtering
#User Based Collaborative Filtering
book_recomm_model2 <- Recommender(book_matrix, method="UBCF")
book_recomm_model2


#Predictions for two users 
recommended_items2 <- predict(book_recomm_model2, book_matrix[411:421], n=5)
as(recommended_items2, "list")
recommended_items2

