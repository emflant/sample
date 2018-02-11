import tensorflow as tf

x_data = [1,2,3]
y_data = [1,2,3]

print([x_data, y_data])

W = tf.Variable(tf.random_uniform([1], -1.0, 1.0), name="W")
b = tf.Variable(tf.random_uniform([1], -1.0, 1.0), name="b")

X = tf.placeholder(tf.float32, name="X")
Y = tf.placeholder(tf.float32, name="Y")


hypothesis = W * X + b

sess = tf.Session()
sess.run(tf.global_variables_initializer())

s = tf.square(hypothesis-Y)
print("input value(X):", x_data)
print("W:", sess.run(W))
print("b:", sess.run(b))
print("tf.square result : ", sess.run(s, feed_dict={X:x_data, Y:y_data}))

cost= tf.reduce_mean(tf.square(hypothesis-Y))
print("cost result : ", sess.run(cost, feed_dict={X:x_data, Y:y_data}))

optimizer = tf.train.GradientDescentOptimizer(learning_rate=0.1)
train_op = optimizer.minimize(cost)

print("[train_op]")
print(train_op)


for step in range(1210):
		print("before : ", sess.run(W), sess.run(b))
		_, cost_val = sess.run([train_op, cost], feed_dict={X:x_data, Y:y_data})
		print(step, cost_val, sess.run(W), sess.run(b))
