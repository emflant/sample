

import tensorflow as tf

hello = tf.constant('Hello, Tensorfolw!!')
print(hello)

a=tf.constant(10)
b=tf.constant(20)
c=tf.add(a,b)

print(c)


sess = tf.Session()

print(sess.run(hello))
print(sess.run(a))
print(sess.run(b))
print(sess.run(c))
print(sess.run([a,b,c]))
