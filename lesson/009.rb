# 選挙の演説

# 条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ M, N, K ≦ 100
・1 ≦ a_i ≦ M

# 算出コード
input_line = gets.split(" ")
candidate_num = input_line[0].to_i
voter_num = input_line[1].to_i
speech_num = input_line[2].to_i
vote_array = []
candidate_num.times do 
    vote_array << 0
end
vote_array << voter_num

speech_num.times do
    c = gets.chomp.to_i
    # 他の候補者支持層から1ずつもらう
    candidate_num.times do |i|
        # 同じ立候補者の場合
        if i == c-1
        # 各候補者への支持者が0でない場合
        elsif vote_array[i] != 0
            vote_array[c-1] += 1
            vote_array[i] -= 1
        end
    end
    # 無投票者が0なければ1もらう
    if vote_array[-1] != 0
        vote_array[c-1] += 1
        vote_array[-1] -= 1
    end
end
candidate_array = vote_array[0...candidate_num]
# 最大得票数を持つ配列を用意
max_candidate = vote_array.select { |c| c == candidate_array.max }
max_candidate.each.with_index do |c, i|
    # 配列の順序に+1して出力
    p candidate_array.index(c) + 1
    # 次の最大得票者数を出力するために現行ループ者の得票数から-1する
    candidate_array[i] -= 1
end