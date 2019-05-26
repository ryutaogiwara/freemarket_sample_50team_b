任意の文字列の最初の2文字を最後尾に持ってきて
その文字を出力するメソッドを作りましょう。

※わからない場合はAPIを利用して問題を解きましょう。
参考URL:https://ref.xaio.jp/ruby

出力例：
left2('Hello') → 'lloHe'
left2('java') → 'vaja'
left2('Hi') → 'Hi'

def left2(str)
  left2 = str.slice!(0,2)
  puts str + left2
end
