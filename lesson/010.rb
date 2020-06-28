# ある数でつくられた数列

# 条件
すべてのテストケースにおいて、以下の条件をみたします。
・P_1, P_2, P_3 はそれぞれ相異なる素数
・2 ≦ P_1, P_2, P_3 ≦ 7
・1 ≦ k ≦ 1,000

# 算出コード
input_line = gets.split(" ")
prime_num1 = input_line[0].to_i
prime_num2 = input_line[1].to_i
prime_num3 = input_line[2].to_i
# 求めたいk番目の+1
asked_num = input_line[3].to_i + 1
# 計算結果の配列
cal_a = []

# 1番目の0〜k乗を後の計算用にkセット追加
asked_num.times do |i|
    asked_num.times do |j|
        cal_a << 1 * prime_num1 ** j * prime_num2 ** 0 * prime_num3 ** 0
    end
end
# 2番目の0〜k乗を配列の各セットごとに乗算
asked_num.times do |i|
    asked_num.times do |j|
        cal_a[ j + asked_num * i ] *= prime_num2 ** i * prime_num3 ** 0
    end
end
cal_a[0..-1] *= 2
# 3番目の0~k乗を配列の各セットに乗算
asked_num.times do |i|
    asked_num.times do |j|
        cal_a[ j + asked_num * i ] *= prime_num3 ** i
    end
end
cal_a_2 = []
# 3番目の0〜k乗を後の計算用にkセット追加
asked_num.times do |i|
    asked_num.times do |j|
        cal_a_2 << 1 * prime_num1 ** 0 * prime_num2 ** 0 * prime_num3 ** j
    end
end
cal_a_2[0..-1] *= 2
# 1番目の0〜k乗を配列の各セットごとに乗算
asked_num.times do |i|
    asked_num.times do |j|
        cal_a_2[ j + asked_num * i ] *= prime_num1 ** i * prime_num2 ** 0
    end
end
half_num = cal_a_2.length / 2
# 2番目の0~k乗を配列の各セットに乗算
asked_num.times do |i|
    asked_num.times do |j|
        cal_a_2[ j + half_num + asked_num * i ] *= prime_num2 ** i
    end
end
# 2番目の0〜k乗を1セット追加
asked_num.times do |i|
    cal_a_2 << 1 * prime_num1 ** 0 * prime_num2 ** i * prime_num3 ** 0
end
# 出来うる値の配列
comb_a = (cal_a << cal_a_2).flatten.sort.uniq
# 解答
puts comb_a[asked_num-2]