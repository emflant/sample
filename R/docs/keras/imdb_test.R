library(keras)
library(tidyverse)
# 너무 오래걸려서 아래 rds 로 저장해놓고 사용.
# mnist = dataset_mnist()
imdb = read_rds(file.path(getwd(), "data", "imdb.rds"))
# str(imdb)

c(c(train_data, train_labels), c(test_data, test_labels)) %<-% imdb

# max(sapply(train_data, max))

# str(train_data) # List of 25000
# length(train_data) # 25000

vectorize_sequence = function(sequences, dimension = 10000){
  results = matrix(0, nrow = length(sequences), ncol = dimension)
  for(i in 1:length(sequences)){
    results[i, sequences[[i]]] = 1
  }
  results
}

x_train = vectorize_sequence(train_data)
x_test = vectorize_sequence(test_data)

# str(train_labels) # int [1:25000]
# str(as.numeric(train_labels)) # num [1:25000]
y_train = as.numeric(train_labels)
y_test = as.numeric(test_labels)

imdb_model = keras_model_sequential() %>% 
  layer_dense(units = 16, activation = "relu", input_shape = c(10000)) %>% 
  layer_dense(units = 16, activation = "relu") %>% 
  layer_dense(units = 1, activation = "sigmoid")

imdb_model %>% compile(
  optimizer = "rmsprop",
  loss = "binary_crossentropy",
  metrics = c("accuracy")
)


# 검증집합 따로 설정하기.
val_indices = 1:10000

x_val = x_train[val_indices,]
partial_x_train = x_train[-val_indices,]
y_val = y_train[val_indices]
partial_y_train = y_train[-val_indices]


history = imdb_model %>% fit(
  partial_x_train, # 15,000 건
  partial_y_train, # 15,000 건
  epochs = 20,
  batch_size = 512,
  validation_data = list(x_val, y_val) # 10,000 건
)
