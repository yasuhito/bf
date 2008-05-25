class Bf
  def initialize
    # メモリ
    @a = [ 0 ] * 30000
    # '[' のあるアドレス - 1
    @b = []
    # ポインタ
    @p = 0
    # '[' のレベル
    @x = 0
  end


  # [NOTE] @j == true (ジャンプ中) である場合、']' 以外の命令は無視される。


  # '>' ポインタをインクリメントする
  def r
    @p += 1 if !@j
  end


  # '<' ポインタをデクリメントする
  def l
    @p -= 1 if !@j
  end


  # '+' ポインタが指す位置の値をインクリメントする
  def i
    @a[ @p ] += 1 if !@j
  end


  # '-' ポインタが指す位置の値をデクレメント
  def d
    @a[ @p ] -= 1 if !@j
  end


  # '.' ポインタが指す位置の値を出力する
  def o
    print @a[ @p ].chr if !@j
  end


  # ',' 1 バイト入力してポインタが指す位置に書き込む
  def n
    @a[ @p ] = $stdin.getc if !@j
  end


  # '[' ポインタが指す値が 0 なら、対応する ']' までジャンプする
  def j
    @x += 1
    if @a[ @p ] == 0
      # ']' までのジャンプ開始
      @j = true
    else
      @b[ @x ] = $i - 1
    end
  end


  # ']' ポインタが指す値が 0 でないなら、対応する '[' までジャンプする
  def e
    if @j
      # '[' からのジャンプ終了
      @j = false
    else
      $i = @b[ @x ]
    end
    @x -= 1
  end
end


bf = Bf.new

# プログラムカウンタ
$i = 0

p = $<.readlines.join.tr( '^><+\-.,[]', '' ).tr( '><+\-.,[]', 'rlidonje' )

while $i < p.size
  bf.send p[ $i ].chr
  $i += 1
end

$stderr << "\n"
