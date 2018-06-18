require("minitest/autorun")
require_relative("../presentation.rb")

class TestPresentation < MiniTest::Test

  def setup()
    options1 = {"name" => "Io", "time_slot" => 3, "capacity" => 12}
    @presentation1 = Presentation.new(options1)
    options2 = {"name" => "Europa", "time_slot" => 4, "capacity" => 10}
    @presentation2 = Presentation.new(options2)
  end

  def test_setup()
    assert_equal("Io", @presentation1.name)
    assert_equal(3, @presentation1.time_slot)
    assert_equal(12, @presentation1.capacity)
  end



end
