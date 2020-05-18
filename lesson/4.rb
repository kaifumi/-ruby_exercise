# 複数形への変換

# 条件
・末尾が s, sh, ch, o, x のいずれかである英単語の末尾に es を付ける
・末尾が f, fe のいずれかである英単語の末尾の f, fe を除き、末尾に ves を付ける
・末尾の1文字が y で、末尾から2文字目が a, i, u, e, o のいずれでもない英単語の末尾の y を除き、末尾に ies を付ける
・上のいずれの条件にも当てはまらない英単語の末尾には s を付ける


# 算出コード
word_number = gets.chomp.to_i
word_box = []
word_number.times do 
    w = gets.chomp
    word_box << w
end
str1 = ["s", "sh", "ch", "o", "x"]
str2 = ["f", "fe"]
str3 = ["y", "a", "i", "u", "e", "o"]

word_box.each do |word|
    if str1.any? { |s| s.include?(word[-1]) }
        puts word + "es"
    elsif str2.any? { |s| s.include?(word[-1]) }
        puts word.reverse.sub!(/f|ef/,"sev").reverse
    elsif word[-1] == "y" && !str3.any? { |s| s.include?(word[-2]) }
        puts word.reverse.sub!(/y/, "sei").reverse
    else
        puts word + "s"
    end
end

# 入力例1
3
dog
cat
pig
#出力例1
dogs
cats
pigs
#入力例2
7
box
photo
axis
dish
church
leaf
knife
#出力例2
boxes
photoes
axises
dishes
churches
leaves
knives
##出力例3
studies
plays