# A017:落ちものシミュレーション

input_line = gets.chomp.split(" ")
height = input_line[0].to_i
width = input_line[1].to_i
block_num = input_line[2].to_i
block_array = []
# 落ちてくるブロックの集合を用意
block_num.times do
    block_array << gets.chomp.split(" ").map{|b| b.to_i }
end
# ブロック落下前の配列を用意
predrop_array = []
height.times do
    predrop_array << ["."]*width
end

# 落下先に障害物があるか確認し、空いている高さの数値を返すメソッド
def check_block(height, block, predrop_array)
    # 高さ 
    block[0]
    # 横
    block[1]
    # 位置
    block[2]
    # フィールドの高さの分だけすでにブロックがないか確認
    # 空いている高さの数値を返す
    height.times do |i|
        # p predrop_array[height - i - 1][block[2]..block[1]+(block[2]-1)].include?("#")
        return height - i if i == height - 1 && predrop_array[height - i - 1][block[2]..block[1]+(block[2]-1)].include?("#")
        return height - i - 1 if i == height - 1
        next unless predrop_array[height - i - 1][block[2]..block[1]+(block[2]-1)].include?("#")
        return height - i
    end
end

# "."を"#"に変更するメソッド
def change_block(block, predrop_array, block_height)
    # p block
    # p block_height
    # ブロックの高さ分だけ"."を"#"に変える
    block[0].times do |i|
        # 横幅1の場合
        if block[1] == 1
            predrop_array[i+block_height][block[2]] = "#"
        # 横幅２以上の場合
        elsif
            predrop_array[i+block_height][block[2]..block[1]+(block[2]-1)] = ["#"]*block[1]
        end
    end
    predrop_array
end

block_array.each do |block|
    block_height = check_block(height, block, predrop_array)
    change_block(block, predrop_array, block_height)
    # puts predrop_array.reverse.map{|a|a.join("")}
end

puts predrop_array.reverse.map{|a|a.join("")}