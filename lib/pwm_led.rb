require 'pwm'

class LED
  PWM_FREQUENCY = 1000  # 1kHz
  
  def initialize(pin)
    @pwm = PWM.new(pin, frequency: PWM_FREQUENCY)
    off
  end

  def on(brightness = 100)
    duty = (brightness / 100.0) * 256  # 8-bit resolution (0-255)
    @pwm.duty(duty.to_i)
  end

  def off
    @pwm.duty(0)
  end

  def blink(times, interval = 0.5)
    times.times do
      on
      sleep interval
      off
      sleep interval
    end
  end

  def fade_in(duration, steps = 20)
    steps.times do |i|
      on(i * 100.0 / (steps - 1))
      sleep duration / steps
    end
  end

  def fade_out(duration, steps = 20)
    steps.times do |i|
      on(100 - i * 100.0 / (steps - 1))
      sleep duration / steps
    end
  end
end
