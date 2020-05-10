def to_hex(r, g, b)
  [r, g, b].inject('#') do |hex, n|
    hex + n.to_s(16).rjust(2, '0')
  end
end

# 正規表現とscanメソッドを使うとこうなる
# scanメソッドは正規表現にマッチした文字列を配列にして返す
'#12abcd'.scan(/\w\w/) #=> ["12", "ab", "cd"]

def to_ints(hex)
  hex.scan(/\w\w/).map(&:hex)
end