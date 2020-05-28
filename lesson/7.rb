# コンテンツ概要
# BookクラスとLibraryクラスを定義しましょう。これらのクラスの機能は、コード例と出力例から推測してください。

# この演習を回答するのに必要と思われる時間は、10分です。

# 演習
# 以下のコード例に利用されているBookクラスとLibraryクラスを定義してください。
# なお、コード例を実行した上で、以下の出力例の文が標準出力へ出力されるように定義しておいてください。
class Library
  def initialize
    @books = []
  end
 
  def <<(book)
    @books << book
  end
 
  def to_s
    puts "Library contents:"
    @books.join("\n")
  end
end
 
class Book
  attr_accessor :author, :title
  def initialize(args)
    @author = args[:author]
    @title  = args[:title]
    args[:library] << self
  end
 
  def to_s
    "Title: " + @title + ", Author: " + @author
  end
end

my_library = Library.new
Book.new(:author => "Herman Melville", :title => "Moby-Dick", :library => my_library)
Book.new(:author => "Hans Christian Andersen", :title => "The Ugly Duckling", :library => my_library)
puts my_library