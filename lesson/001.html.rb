<%# 給与計算 %>
<%# 入力値 %>
X Y Z
N
S_1 T_1
S_2 T_2
...
S_N T_N

<%# 算出コード %>
input_lines = gets.split(" ")
X = input_lines[0].to_i
Y = input_lines[1].to_i
Z = input_lines[2].to_i

number = gets.chomp.to_i

work_times = []
number.times do
    s = gets.chomp.split(" ")
    work_times.push([s[0],s[1]])
end

sum=0
work_times.each do |wt|
    if wt[0].to_i >= 0 && wt[0].to_i < 9
      sum += Z * (wt[1].to_i - wt[0].to_i)
      sum -= (Z - X) * (wt[1].to_i - 9) if wt[1].to_i > 9
      sum -= ( X - Y ) * (wt[1].to_i - 17) if wt[1].to_i > 17
      sum -= ( Y - Z ) * (wt[1].to_i - 22) if wt[1].to_i > 22
    elsif wt[0].to_i >= 9 && wt[0].to_i < 17
      sum += X * (wt[1].to_i - wt[0].to_i)
      sum -= (X - Y) * (wt[1].to_i - 17) if wt[1].to_i > 17
      sum -= ( Y - Z ) * (wt[1].to_i - 22) if wt[1].to_i > 22
    elsif wt[0].to_i >= 17 && wt[0].to_i < 22
      sum += Y * (wt[1].to_i - wt[0].to_i)
      sum -= (Y - Z) * (wt[1].to_i - 22) if wt[1].to_i > 22
    else
      sum += Z * (wt[1].to_i - 22)
    end
end

pp sum