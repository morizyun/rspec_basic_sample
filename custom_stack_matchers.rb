module CustomStackMatchers
  class PopLatestPushedValue # (1) 専用のクラスを作成
    def initialize(expected)
      @expected = expected
    end

    def matches?(stack) # (2) スペック実行時に呼ばれる。真偽値を返す。
      stack.push(@expected)
      @popped_val = stack.pop

      @popped_val == @expected
    end

    def description
      "pop a object, after push the object"
    end

    def failure_message # (3) should の失敗メッセージ
      <<-MSG
      poped value should equal latest pushed value #{@expected.inspect}, but was #{@popped_val.inspect}
      MSG
    end

    def negative_failure_message # (4) should_not の失敗メッセージ
      <<-MSG
      poped value should not equal latest pushed value #{@expected}, but was #{@popped_val}
      MSG
    end
  end

  def pop_latest_pushed_value(expected)
    PopLatestPushedValue.new(expected)
  end
end