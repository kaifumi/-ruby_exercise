# B080:【2020年七夕問題】みんなでスゴロク

input_line_1 = gets.chomp.split(" ")
square_count = input_line_1[0].to_i
player_count = input_line_1[1].to_i
turn_count = input_line_1[2].to_i
player_position = []
player_coin = []
goal_array = []

# 各ユーザーの初期位置と初期コイン数を代入
player_count.times do
    player_position << 0
    player_coin << 0
end

move_effect_array = []
coin_effect_array = []
# 各移動効果とコイン効果を代入
(square_count-2).times do
    input_line_2 = gets.chomp.split(" ")
    move_effect_array << input_line_2[0].to_i
    coin_effect_array << input_line_2[1].to_i
end

move_effect_array
coin_effect_array


# player_positionの要素が0以下もしくは(square_count-1)数以上にならないようにするメソッド
def out_position_escape(position_number, square_count)
    if position_number < 0
        position_number = 0
    elsif position_number > square_count - 1
        position_number = square_count - 1
    end
    position_number
end

# コイン所持枚数が0枚にならないようにするメソッド
def out_coin_escape(coin_number)
    if coin_number < 0
        coin_number = 0
    end
    coin_number
end

turn_count.times do |j|
    # 各プレイヤーのサイコロの目の配列を用意
    input_dice_number = gets.chomp.split(" ").map{|n| n.to_i}
    player_count.times do |i|
        # まだゴールしていない場合
        if player_position[i] < square_count - 1
            # サイコロの目を移動位置として代入
            player_position[i] += input_dice_number[i]
            # 移動後がにゴールにいればゴールの値を入れる
            player_position[i] = out_position_escape(player_position[i], square_count)
            # 移動後にスタートとゴールの間にいる場合
            if player_position[i] > 0 && player_position[i] < square_count - 1
                tmp_position = player_position[i]
                # 移動効果を適用
                player_position[i] += move_effect_array[tmp_position - 1]
                # コイン効果を適用
                player_coin[i] += coin_effect_array[tmp_position - 1]
                # 移動後がにスタートかゴールにいればを正規化する
                player_position[i] = out_position_escape(player_position[i], square_count)
                # コインが0枚より少なければ０枚にする
                player_coin[i] = out_coin_escape(player_coin[i])
            else
            end
            # もしゴールして、未ゴールであれば代入する
            if player_position[i] == square_count - 1 && !goal_array&.include?(i)
                goal_array << i
            end
        else
            player_coin[i] += input_dice_number[i] * (3 - goal_array.index(i))
        end
    end
end

puts "#{player_coin.index(player_coin.max) + 1} #{player_coin.max}"