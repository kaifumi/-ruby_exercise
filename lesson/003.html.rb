# 文章のサイズ変更

# 入力値
H W X
s_1
s_2
...
s_H

# 算出コード
input_line = gets.split(' ')
h = input_line[0].to_i
w = input_line[1].to_i
changed_w = input_line[2].to_i

connect_c = ""
h.times do
    line_c = gets.chomp
    connect_c += line_c
end

changed_h = connect_c.length / changed_w
changed_h += 1 if connect_c.length % changed_w


changed_h.times do
    puts connect_c.slice!(0..changed_w-1)
end