require("minitest/autorun")
require_relative("../presentation.rb")

class TestPresentation < MiniTest::Test

  def setup()
    options = {"id" => 1, "name" => "Io", "time_slot" => 3, "capacity" => 12}
    @presentation1 = Presentation.new(options)
  end

  def test_setup()
    assert_equal("Io", @presentation1.name)
    assert_equal(3, @presentation1.time_slot)
    assert_equal(12, @presentation1.capacity)
  end

  def test_save()
    @presentation1.save()
    assert_equal("Io", @presentation1.name)
  end

  

end
