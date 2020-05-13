<%# ポイント払い %>

<%# 入力値 %>
N M
f_1
f_2
...
f_M

<%# 算出コード %>
input_line = gets.chomp.split(' ')

balance = input_line[0].to_i
ride_numbers = input_line[1].to_i
fare_points = 0

ride_numbers.times do 
    # 運賃
    fare = gets.chomp.to_i
    if fare > fare_points
        # point
        fare_points += fare / 10
        balance -= fare
        # 出力
        print balance
        puts " #{fare_points}"
    else
        fare_points -= fare
        # 出力
        print balance
        puts " #{fare_points}"
    end
end