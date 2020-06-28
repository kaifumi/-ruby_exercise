# C080:【2020年七夕問題】ボタンを押すゲーム

input_line = gets.chomp.split(" ")
btn_num =  input_line[0].to_i
over_num =  input_line[1].to_i
btn_push_count = gets.to_i
control_log = gets.chomp.split(" ").map{|x| x.to_i}
success_num = 0
missing_num = 0

btn_push_count.times do |i|
    t = i + 1
    t = t - 4 if t > btn_num
    if t == control_log[i]
        success_num += 1
    elsif t != control_log[i]
        missing_num += 1
    end
    if missing_num == over_num
        puts -1
        break
    end
    puts success_num * 1000 if i + 1 == btn_push_count
end