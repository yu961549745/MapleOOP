# 对象集合
通过复制生成的多个对象，在默认集合操作下，会被视为是不同的对象。而很多时候，我们需要将值相同的对象视为是同一个对象，并且希望集合操作能够具有对象唯一化的功能。

该功能可以通过给每个对象一个key值，利用table实现。

如果在对象内重载`{}`操作符，就可以让对象的集合操作具有唯一化的功能。

也可以将该功能单独打包为一个函数，使其适用于任意对象。