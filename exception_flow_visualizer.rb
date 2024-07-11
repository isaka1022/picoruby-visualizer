class ExceptionFlowVisualizer
  def initialize
    @yellow_led = LED.new(18)  # メソッド呼び出し深度
    @green_led = LED.new(17)   # 正常実行
    @red_led = LED.new(16)     # 例外とエラー処理
  end

  def visualize
    begin
      execute_method_chain
    rescue => e
      handle_exception(e)
    ensure
      cleanup
    end
  end

  def execute_method_chain
    @green_led.on
    puts "正常実行開始"
    sleep 2
    5.times do |i|
      @yellow_led.on((i + 1) * 8)
      puts "メソッド呼び出し深度: #{i + 1}"
      sleep 3
      raise "シミュレートされた例外" if i == 4
    end
  end

  def handle_exception(exception)
    @green_led.off
    @yellow_led.off
    puts "例外発生: #{exception.message}"
    sleep 2
    @red_led.blink(3, 1)
    puts "例外処理開始"
    sleep 2
    5.downto(1) do |i|
      @red_led.on(i * 8)
      puts "スタック巻き戻し: レベル #{i}"
      sleep 2
    end
    @red_led.off
  end

  def cleanup
    puts "クリーンアップ処理"
    sleep 2
    [@yellow_led, @green_led, @red_led].each do |led|
      led.blink(1, 1)
    end
    puts "処理完了"
  end
end
