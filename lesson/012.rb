# B051:汚れてしまった魔方陣

#条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・3 ≦ N ≦ 10
# ・0 ≦ m_{i, j} ≦ N*N (1 ≦ i ≦ N, 1 ≦ j ≦ N)
# ・m{1, 1}, m{1, 2}, ..., m_{N, N} の中で 2 つだけ 0 になるものが存在する
# ・m{i, j} ≠ 0, m{k, l} ≠ 0 となる i, j, k, l について (i, j) ≠ (k, l) のとき m{i, j} ≠ m{k, l} が成り立つ (1 ≦ i, j, k, l ≦ N)

# 算出コード
# 魔法陣の行数
line_count = gets.to_i
line_array = []

# 行ごとの数値の配列を作成
line_count.times do
    input_line = gets.chomp.split(" ")
    tmp_array = input_line.map {|i| i.to_i }
    line_array << tmp_array
end

# 一列の合計を求める
line_sum = line_array.map {|l| l.sum }.max

line_count.times do |i|
    # 配列ごとに0をチェック
    line_array[i].each.with_index do |num, j|
        # 0があれば値を計算する
        if num == 0
            # 同じ配列内に0がもう一つある場合
            if line_array[i].count(0) == 2
                # 該当する0以外の縦列合計算出
                row_sum = 0
                (line_count-1).times do |l|
                    row_sum += line_array[i + l - line_array.length + 1][j]
                end
                # 0と代替される数字
                sub_num = line_sum - row_sum
                line_array[i][j] = sub_num
            # 別のところにある場場合か2個目の時
            else
                sub_num = line_sum - line_array[i].sum
                line_array[i][j] = sub_num
            end
        end
    end
end
line_array.each do |line|
    puts line.join(" ")
end