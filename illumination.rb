# LEDクラスの定義
class LED
  def initialize(pin_number)
    @pin = GPIO.new(pin_number, GPIO::OUT)
    off
  end

  def on
    @pin.write(1)
  end

  def off
    @pin.write(0)
  end
end

# イルミネーションパターンを管理するクラス
class Illumination
  def initialize(leds)
    @leds = leds
  end

  # 全てのLEDを同時に点滅させるパターン
  def blink_pattern(count)
    count.times do
      @leds.each { |_, led| led.on }
      sleep 0.5
      @leds.each { |_, led| led.off }
      sleep 0.5
    end
  end

  # 順番に点灯するパターン
  def chase_pattern(count)
    count.times do
      @leds.each do |_, led|
        led.on
        sleep 0.2
        led.off
      end
    end
  end

  # すべてのパターンを順番に実行
  def run_all_patterns(repeat)
    repeat.times do
      blink_pattern(5)
      chase_pattern(3)
    end
  end
end

# メイン処理
leds = {
  red: LED.new(18),
  green: LED.new(17),
  yellow: LED.new(16)
}
illumination = Illumination.new(leds)

# パターンの実行
illumination.run_all_patterns(2)

puts "Illumination patterns completed"
