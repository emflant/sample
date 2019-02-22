install.packages("keras")

library(keras)
library(tidyverse)

# install_keras()


file_text <- get_file_text(getwd())
r1 = file_text %>%
  filter(str_detect(source, "saveRDS"))


matrix(1:6, dim = c(2,3,1))

array(rep(0, 2*3*4), dim = c(2,3,4))

getwd()

# http 로 가져오는 거라 많이 느림.
# mnist = dataset_mnist()
# saveRDS(mnist, file.path(getwd(), "data", "mnist.rds"))
# 대신 rds 파일로 저장해놓은 걸 가져옴.
mnist = read_rds(file.path(getwd(), "data", "mnist.rds"))

str(mnist)

train_images = mnist$train$x
train_labels = mnist$train$y
test_images = mnist$test$x
test_labels = mnist$test$y

plot(as.raster(train_images[5874,,], max = 255))

network <- keras_model_sequential() %>%
  layer_dense(units = 512, activation = "relu", input_shape = c(28 * 28)) %>%
  layer_dense(units = 10, activation = "softmax")
network %>%
  compile(optimizer = "rmsprop", 
          loss = "categorical_crossentropy",
          metrics = c("accuracy"))
train_images2 <- array_reshape(train_images, c(60000, 28*28))
train_images2 <- train_images2 / 255

test_images2 <- array_reshape(test_images, c(10000, 28*28))
test_images2 <- test_images2 / 255


train_labels2 = to_categorical(train_labels)
test_labels2 = to_categorical(test_labels)

network %>% fit(train_images2, train_labels2, epochs = 10, batch_size = 128)

metrics = network %>%evaluate(test_images2, test_labels2)
metrics


network %>% predict_classes(test_images2[1:5,])
#  [1] 7 2 1 0 4 1 4 9 5 9

plot(as.raster(test_images[2,,], max = 255))

matrix(1:6, nrow = 2, ncol = 3, byrow = T)

matrix(1:6, nrow = 2, ncol = 3, byrow = T) * 
  matrix(1:6, nrow = 2, ncol = 3, byrow = T)

matrix(1:6, nrow = 2, ncol = 3, byrow = T) %*% 
  matrix(1:6, nrow = 4, ncol = 2, byrow = T)
