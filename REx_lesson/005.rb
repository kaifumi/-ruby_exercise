# 次のコードを実行するとどうなりますか

hoge = "a".to_h
puts hoge.class

# to_hは値をハッシュにするメソッド
# Stringクラスにはto_hメソッドは使えない
# ※Arrayクラスなどに使われる

# p String.method_defined?(:to_h)
# <実行結果>
# false