# $: グローバル変数。
$val = 0

class Count
  def self.up
    $val = $val + 1
    # 条件演算子（三項演算式）
    # 条件演算子では条件式を評価し、真(true)だった場合には真の時の値を、偽(false)だった場合には偽の時の値を式全体の値ととして返します。
    $val == 3 ? true : false
  end
end

# any?: すべての要素が偽である場合に false を返します。真である要素があれば、ただちに true を返します。
# [*1..10]: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]のように展開される
[*1..10].any? do
  Count.up
end

p $val