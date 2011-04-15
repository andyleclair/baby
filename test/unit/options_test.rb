require 'test/unit'

class OptionsTest < Test::Unit::TestCase

  def setup
    @default = Options.new
  end

  def test_foo0
    parsed = parse_file('foo0')
    assert @default.instrument == parsed.instrument
    assert @default.key == parsed.key
    assert @default.time_sig == parsed.time_sig
    assert @default.difficulty == parsed.difficulty
    assert @default.length == parsed.length
  end

  def test_foo1
    parsed = parse_file('foo1')
    assert 'piano' == parsed.instrument, "Instrument was #{ parsed.instrument }, expected 'piano'"
    assert parsed.key == {:key => 'f', :mode => nil } , "Key was #{ parsed.key }, expected 'F'"
    assert 16 == parsed.length, "Length was #{ parsed.length }, expected 16"
    assert @default.time_sig == parsed.time_sig
    assert @default.difficulty == parsed.difficulty	
  end

  def test_foo2
    parsed = parse_file('foo2')
    assert @default.instrument == parsed.instrument, "Instrument was #{ parsed.instrument }, expected 'soprano recorder'"
    assert parsed.key == {:key => 'fb', :mode => 'major' } , "Key was #{ parsed.key }, expected 'Fb major'"
    assert 16 == parsed.length, "Length was #{ parsed.length }, expected 16"
    assert "9/8" == parsed.time_sig, "Expected time sig 9/8, got #{ parsed.time_sig }"
    assert @default.difficulty == parsed.difficulty	
  end

  def parse_file(name)
    Options.parse "test/fixtures/options/#{name}"
  end
end
