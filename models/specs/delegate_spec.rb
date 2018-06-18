require("minitest/autorun")
require_relative("../delegate.rb")

class TestDelegate < MiniTest::Test

  def setup()
    options1 = {"name" => "Colby Galileo", "board_member" => true}
    @delegate1 = Delegate.new(options1)
    options2 = {"name" => "Thomas Feser"}
    @delegate2 = Delegate.new(options2)
  end

  def test_setup()
    assert_equal("Colby Galileo", @delegate1.name)
    assert(@delegate1.board_member)
    assert(!@delegate2.board_member)
  end

  

end
