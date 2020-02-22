library(keras)

# 너무 오래걸려서 아래 rds 로 저장해놓고 사용.
# mnist = dataset_mnist()
mnist = read_rds(file.path(getwd(), "data", "mnist.rds"))

train_images = mnist$train$x
train_labels = mnist$train$y

test_images = mnist$test$x
test_labels = mnist$test$y

str(train_images)
str(test_images)


my_network = keras_model_sequential() %>% 
  layer_dense(units = 512, activation = "relu", input_shape = c(28 * 28)) %>% 
  layer_dense(units = 10, activation = "softmax")

my_network %>% compile(
    optimizer = "rmsprop",
    loss = "categorical_crossentropy",
    metrics = c("accuracy")
  )

train_images = array_reshape(train_images, c(60000, 28 * 28))
train_images = train_images / 255

test_images = array_reshape(test_images, c(10000, 28 * 28))
test_images = test_images / 255

train_labels = to_categorical(train_labels)
test_labels = to_categorical(test_labels)

my_network %>% fit(train_images, train_labels, epochs = 5, batch_size = 128)

my_metrics = my_network %>% evaluate(test_images, test_labels)

my_metrics

my_network %>% predict_classes(test_images[1:10,])
test_labels[1:10, ]

dim(mnist$train$x)

digit = mnist$train$x[5,,]
dim(digit)
as.raster(digit, max = 255)
plot(as.raster(digit, max = 255))

sweep
array(round(runif(1000, 0, 9)), dim = c(64,3,32,10))


med.att <- apply(attitude, 2, median)
attitude
med.att
data.matrix(attitude)
sweep(data.matrix(attitude), 1, med.att, "+")


a1 = array(1, dim = c(3,4))
sweep(a1, 1, c(10,100,1000), "+")
sweep(a1, 2, c(50,500,5000,50000), "+")

a2 = array(seq(100, 1200, by = 100), dim = c(3,4))
a2
sweep(a1, c(1,2), a2, "+")
