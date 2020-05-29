# 表の自動生成

# 条件
すべてのテストケースにおいて、以下の条件をみたします。

・2 ≦ N ≦ 100
・1 ≦ X ≦ 100,000
・1 ≦ a_i, b_i, c_i, d_i ≦ 5,000 (1 ≦ i ≦ N)

# 算出コード
input_line = gets.split(" ")
taxi_num = input_line[0].to_i
destination_m = input_line[1].to_i
paid_array = []

taxi_num.times do
    input_tmp = gets.chomp.split(" ")
    taxi_case = input_tmp.map { |t| t.to_i }
    ride_distance = taxi_case[0]
    paid_price = taxi_case[1]
    # 初乗り距離未満の場合
    if destination_m < ride_distance
        paid_array << paid_price
    # 初乗り距離以上の場合
    else destination_m >= ride_distance
        # 初乗り距離後〜目的地までの距離を割り切れない場合
        if (destination_m - ride_distance) % taxi_case[2]
            paid_array << paid_price + taxi_case[3] * ((destination_m - ride_distance) / taxi_case[2] + 1)
        # 初乗り距離後〜目的地までの距離を割り切れる場合
        else
            paid_array << paid_price + taxi_case[3] * ((destination_m - ride_distance) / taxi_case[2])
        end
    end
end
high_low_table = [paid_array.sort.first, paid_array.sort.last]
puts high_low_table.join(" ")