# A023:週休2日制

schedule_days = gets.to_i
day_array = gets.chomp.split(" ").map{ |d| d.to_i }
# 週休2日の週の配列
one_holiday_weeks = []
# 週休2日の週の配列
two_holiday_weeks = []


# ７日間ずつ週休２日の数をチェックする
(schedule_days - 6).times do |i|
    # 週休２日の場合
    day_array[i..i+6]
    if day_array[i..i+6].count(0) >= 2
        two_holiday_weeks << i
    # 週休１日の場合
    else
        one_holiday_weeks << i
    end
end

# [最大連続週休２日日数を求めるには、全体から調べる必要がある。]

# 最も週休２日の期間が続いた日数を返すメソッド
def most_differense_week(schedule_days, one_holiday_weeks)
    # 週休の１日の数が1より多くある場合
    if one_holiday_weeks.length >= 1
        week_num_array = []
        # 週休１日ごとの差分を出して、最大連続週休２日日数を求める
        (one_holiday_weeks.length-1).times do |i|
            week_num_array << (one_holiday_weeks[i+1] - one_holiday_weeks[i] -1)
        end
        # 初日から週休１日になるまでの週を挿入
        week_num_array << one_holiday_weeks[0] if one_holiday_weeks[0] != 0
        # 週休１日だった最終日から連続して続いた週休２日の週を挿入
        week_num_array << (schedule_days - 6) - (one_holiday_weeks.last + 1)
        if week_num_array.max == 0
            0
        else
            week_num_array.max + 6
        end
    # 週休1日が1回の場合
    # elsif one_holiday_weeks.length == 1
    #     schedule_days - 1
    # 週休1日が0回の場合
    elsif one_holiday_weeks.length == 0
        schedule_days
    end
end
# p one_holiday_weeks
# p two_holiday_weeks
# p schedule_days
puts most_differense_week(schedule_days, one_holiday_weeks)