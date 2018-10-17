'''
    OC中数据持久化的方案都有哪些？一一给出对应的实现代码
    1、沙盒、
    2、钥匙串、
    3、文件存储、
    4、数据库存储
小规模数据，弱业务相关的数据放在沙盒中；
生成的UUID等需要加密的非常小的数据保存在钥匙串里面；
文件存储包括了plist、archive、stream等方式，一般需要方便查询的数据，会以plist的方式存储、archive适合平时很少使用，但数据量很大的数据、stream用来存储图片等数据量不算太大的那种；
当数据有状态和类别等强业务相关的时候，采用数据库方案比较好。
---------------------

'''