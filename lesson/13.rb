B043:ねずみ小僧

#条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・1 ≦ H, W ≦ 50
# ・1 ≦ h0 ≦ H
# ・1 ≦ w0 ≦ W
# ・各 i (1 ≦ i ≦ H) について、s_i は "." と "*" のみからなる長さ W の文字列である
# ・2,000 回以内の移動でねずみ小僧は町の外に出る

# 算出コード
input_line = gets.chomp.split(" ")
H = input_line[0].to_i
W = input_line[1].to_i
input_line = gets.chomp.split(" ")
# [2, 2]にいるなら[1, 1]にする
current_point = [input_line[0].to_i - 1, input_line[1].to_i - 1]
# いまの方角を格納（北:1, 東:2, 南:3, 西:4 ）
direction = 1
# 家の配列を用意
house_array = []
H.times do 
    house_array << gets.chomp.split("")
end
# ネズミ小僧が街の外にいるならtrueを返す
def out_town_judge(current_point)
    if current_point[0] == - 1 || current_point[0] > H - 1
        return true
    elsif current_point[1] == - 1 || current_point[1] > W - 1
        return true
    else
        return false
    end
end

# 現在位置と方角に合わせて移動先を決める
2000.times do
    # 現在位置が庶民の家にいる場合
    if house_array[current_point[0]][current_point[1]] == "."
        # 富豪から庶民に変更
        house_array[current_point[0]][current_point[1]] = "*"
        # 現在の方角が1(北)の場合
        if direction == 1
            current_point[1] += 1
        # 現在の方角が2(東)の場合
        elsif direction == 2
            current_point[0] += 1
        # 現在の方角が3(南)の場合
        elsif direction == 3
            current_point[1] -= 1
        # 現在の方角が4(西)の場合
        elsif direction == 4
            current_point[0] -= 1
        end
        # 現在の方角西の場合、北に変更
        if direction == 4
            direction = 1
        # 現在の方角西以外の場合、90度右へ向く
        else
            direction += 1
        end
    # 現在位置が富豪の家にいる場合
    else
        # 庶民から富豪に変更
        house_array[current_point[0]][current_point[1]] = "."
        # 現在の方角が1(北)の場合
        if direction == 1
            current_point[1] -= 1
        # 現在の方角が2(東)の場合
        elsif direction == 2
            current_point[0] -= 1
        # 現在の方角が3(南)の場合
        elsif direction == 3
            current_point[1] += 1
        # 現在の方角が4(西)の場合
        elsif direction == 4
            current_point[0] += 1
        end
        # 現在の方角北の場合、西に変更
        if direction == 1
            direction = 4
        # 現在の方角北以外の場合、90度左へ向く
        else
            direction -= 1
        end
    end
    if out_town_judge(current_point)
        house_array.map { |h| puts h.join() }
        break
    end
end