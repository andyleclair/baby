require 'test/unit'

class ParseTest < Test::Unit::TestCase

  def test_parsing
    Dir['test/fixtures/options/**'].each do |file|
      puts file
      puts '!!!!!!!!!!!!1'
      `./c4500 #{ file } test/temp.txt`
      output = `lilypond -d backend=null test/temp.txt`
      assert !output.include?('error')
      assert !output.include?('warning')
    end
  end
end
