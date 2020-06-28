# 最遅出社時刻

# 条件
すべてのテストケースで以下の条件を満たします。
1 ≦ a, b, c ≦ 30
1 ≦ N ≦ 180
h_i:m_i は 6:00 から 8:59 の間の時刻

時刻 (h_1:m_1), (h_2:m_2), ..., (h_N:m_N) は早い順に並んでいます。また、同じ時刻に発車する電車は存在しません。
遅刻せずに出社することができる電車が、少なくとも 1 本は存在します。


# 算出コード
input_line = gets.split(" ")
# 各所要時間の配列
time_array = input_line.map { |t| t.to_i}
# 電車の本数
train_number = gets.chomp.to_i
# 電車の到着時間の配列
arrival_array = []
train_number.times do
   arrival_array << gets.chomp.split(" ")
end

# 間に合う時間の配列
availables = []
limit_min = 8 * 60 + 59

arrival_array.each do |h, m|
    # 到着時刻の分表示
    arrival_min = h.to_i * 60 + m.to_i
    # 乗車時刻の分表示
    coming_work_min = arrival_min + time_array[1] + time_array[2]
    if  limit_min >= coming_work_min
        availables << [h.to_i, m.to_i]
    end
end

# 最遅で間に合う時刻の分表示
limit_available_min = availables.last[0] * 60 + availables.last[1] - time_array[0]
limit_available_h = limit_available_min / 60
limit_available_m = limit_available_min % 60
# 分が10以下の場合は0埋め条件のため追加する
if limit_available_m < 10
    puts "0#{limit_available_h}:0#{limit_available_m}"
else
    puts "0#{limit_available_h}:#{limit_available_m}"
end