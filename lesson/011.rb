# パン屋さん

# 条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ N ≦ 30
・1 ≦ Q ≦ 50
・各 i (1 ≦ i ≦ N) について
　・1 ≦ a_i ≦ 500
　・0 ≦ b_i ≦ 20
・各 i, j (1 ≦ i ≦ Q, 1 ≦ j ≦ N) について
　・q_i は "bake" か "buy" のいずれか
　・0 ≦ c_{i, j} ≦ 1000

# 算出コード
input_line = gets.chomp.split(" ")
bread_genre_count = input_line[0].to_i
bread_query_count = input_line[1].to_i
stock_array = []

bread_genre_count.times do
    bread_info = gets.chomp.split(" ")
    stock_array << [bread_info[0].to_i, bread_info[1].to_i]
end
output_array = []

bread_query_count.times do |i|
    input_query = gets.chomp.split(" ")
    buy_price = 0
    ng_case = []
    if input_query[0] == "buy"
        bread_genre_count.times do |j|
            stock_array[j][1]
            input_query[j+1].to_i
            ng_case << 1 if stock_array[j][1] < input_query[j+1].to_i
        end
        if ng_case.include?(1)
            output_array << -1
        else
            bread_genre_count.times do |j|
                stock_array[j][1] -= input_query[j+1].to_i
                buy_price += stock_array[j][0] * input_query[j+1].to_i
            end
        end
    else
        bread_genre_count.times do |t|
            stock_array[t][1] += input_query[t+1].to_i
        end
    end
    output_array << buy_price if buy_price != 0
end
puts output_array