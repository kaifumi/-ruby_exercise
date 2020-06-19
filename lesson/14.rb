# A005:パイザボウルゲーム

# 条件
# 全てのテストケースにおいて、以下の条件を満たします。
# 1≦a≦100
# 1≦b≦100
# a+1≦n≦2a+1
# p_i は 1≦p_i≦b を満たす整数、または半角アルファベット 'G'
# 上記のルールに則り最後までゲームを行った時のデータが与えられる。

# 算出コード
input_line = gets.chomp.split(" ")
flame_num = input_line[0].to_i
pin_num = input_line[1].to_i
# 結果的に投げた回数
throw_num = input_line[1].to_i
# 倒れたピンの数の配列(ガーターは0になる)
down_pins_array = gets.chomp.split(" ").map{|i| i.to_i}
score = 0
# 現在のフレーム番目
current_flame = 0
# 現在の投球番目
current_throw = 0
# 未加算ストライク数
after_add_strike_num = 0

# ストライクとスペアの追加のスコアを返すメソッド
def after_add(down_pins_array, current_throw, after_add_strike_num, pin_num)
    add_score = 0
    down_pins_array
    # 前回も前々回の投球もストライクだった場合
    if after_add_strike_num >= 2
    # if down_pins_array[current_throw - 1] == 10 && down_pins_array[current_throw - 2] == 10
        add_score += down_pins_array[current_throw] * 2
        add_score += down_pins_array[current_throw + 1] if down_pins_array[current_throw] != pin_num
    # 前回の投球がストライクだった場合
    elsif after_add_strike_num == 1
    # elsif down_pins_array[current_throw - 1] == 10
        add_score += down_pins_array[current_throw]
        add_score += down_pins_array[current_throw + 1] if down_pins_array[current_throw] != pin_num
    # 前回のフレームがスペアだった場合
    elsif down_pins_array[current_throw - 1] + down_pins_array[current_throw - 2] == pin_num
        add_score += down_pins_array[current_throw]
    end
    add_score
end

# フレーム数だけ試行
flame_num.times do |i|
    # 現在のフレーム番目と試行回数が同じ場合
    if flame_num != current_flame + 1
        # ストライクだった場合
        if down_pins_array[current_throw] == pin_num
            # 倒れたピンを足す
            score += down_pins_array[current_throw]
            # 過去のストライク、スペア分を足す
            score += after_add(down_pins_array, current_throw, after_add_strike_num, pin_num)
            current_throw += 1
            after_add_strike_num += 1
        # ストライクではなかった場合
        else
            # 倒れたピンを足す
            score += down_pins_array[current_throw]
            # 2投目に倒れたピンを足す
            score += down_pins_array[current_throw + 1]
            # 過去のストライク、スペア分を足す
            score += after_add(down_pins_array, current_throw, after_add_strike_num, pin_num) unless current_throw == 0
            current_throw += 2
            after_add_strike_num = 0
        end
    # 最終フレームの場合 
    else
        # ストライクだった場合
        if down_pins_array[current_throw] == pin_num
            # 倒れたピンを足す
            score += down_pins_array[current_throw]
            # 過去のストライク、スペア分を足す
            score += after_add(down_pins_array, current_throw, after_add_strike_num, pin_num)
            after_add_strike_num += 1
            # 最終フレーム2投目がスペアの場合
            if down_pins_array[current_throw + 1] == pin_num
                # 倒れたピンを足す
                score += down_pins_array[current_throw + 1]
                # 過去のストライク、スペア分を足す
                score += after_add(down_pins_array, current_throw + 1, after_add_strike_num, pin_num)
            # 2投目はストライクでは無かった場合
            else
                score += down_pins_array[current_throw + 1] * 2
                score += down_pins_array[current_throw + 2] * 2
            end
        # ストライクではなかった場合
        else
            # 倒れたピンを足す
            score += down_pins_array[current_throw]
            # 2投目に倒れたピンを足す
            score += down_pins_array[current_throw + 1]
            # 過去のストライク、スペア分を足す
            score += after_add(down_pins_array, current_throw, after_add_strike_num, pin_num)
            after_add_strike_num = 0
            # 2投目でスペアだった場合
            if down_pins_array[current_throw] + down_pins_array[current_throw + 1] == pin_num
                # 3投目に倒れたピンを足す
                score += down_pins_array[current_throw + 2]
                # 過去のストライク、スペア分を足す
                score += after_add(down_pins_array, current_throw + 2, after_add_strike_num, pin_num)
            end
        end
    end
    current_flame += 1
    # 現在の投球回数が結果的な投球数よりも多い場合に終了する
    break if current_throw + 1 > down_pins_array.length
end
puts score