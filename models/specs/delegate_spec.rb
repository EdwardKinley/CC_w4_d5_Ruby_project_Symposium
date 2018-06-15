require("minitest/autorun")
require_relative("../delegate.rb")

class TestDelegate < MiniTest::Test

  def setup()
    options = {"id" => 1, "name" => "Colby Galileo", "board_member" => true}
    @delegate1 = Delegate.new(options)
  end

  def test_setup()
    assert_equal("Colby Galileo", @delegate1.name)
    assert(@delegate1.board_member)
  end

  

end
