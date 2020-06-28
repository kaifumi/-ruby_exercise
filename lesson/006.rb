# 表の自動生成

# 条件
すべてのテストケースにおいて、以下の条件をみたします。

・2 ≦ H, W ≦ 100
　・全ての i (1 ≦ i ≦ 2), j (1 ≦ j ≦ 2) に対して以下の条件を満たす
　・-10,000 ≦ a_{i, j} ≦ 10,000
・問題文に述べた条件を満たす結果の表は必ずただ一つだけ存在します


# 算出コード
input_line = gets.split(" ")
H = input_line[0].to_i # 行数
W = input_line[1].to_i # 列数

# 2*2から2*WまでとH*2を先に求める
input_line1 = gets.split(" ")
a1_1 = input_line1[0].to_i
a1_2 = input_line1[1].to_i
input_line2 = gets.split(" ")
a2_1 = input_line2[0].to_i
a2_2 = input_line2[1].to_i
fill_array = [[a1_1, a1_2],[a2_1, a2_2]]
(H-2).times do |i|
    fill_array << []
end

# 2*2から2*Wまで求める
(W-2).times do |i|
    fill_array[0] << fill_array[0][i+1] + a1_2 - a1_1
    fill_array[1] << fill_array[1][i+1] + a2_2 - a2_1
end
# 2*2からH*2までを求める
(H-2).times do |i|
    fill_array[i+2] << fill_array[i+1][0] + a2_1 - a1_1
    fill_array[i+2] << fill_array[i+1][1] + a2_2 - a1_2
end

# 2*WからH*Wまで求める
fill_array.each do |a|
    next if a.length == W
    (W-2).times do |i|
        a << a[i+1] + a[i+1] - a[i]
    end
end

fill_array.each do |a|
    puts a.join(' ')
end