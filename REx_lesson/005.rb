# 次のコードを実行するとどうなりますか

hoge = "a".to_h
puts hoge.class

# to_hは値をハッシュにするメソッド
# Stringクラスにはto_hメソッドは使えない
# ※Arrayクラスなどに使われる