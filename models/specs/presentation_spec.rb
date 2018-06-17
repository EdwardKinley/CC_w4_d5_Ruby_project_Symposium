require("minitest/autorun")
require_relative("../presentation.rb")

class TestPresentation < MiniTest::Test

  def setup()
    options1 = {"id" => 1, "name" => "Io", "time_slot" => 3, "capacity" => 12}
    @presentation1 = Presentation.new(options1)
    options2 = {"id" => 2, "name" => "Europa", "time_slot" => 4, "capacity" => 10}
    @presentation2 = Presentation.new(options2)
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

  def test_all()
    Presentation.delete_all()
    @presentation1.save()
    @presentation2.save()
    assert_equal(2, Presentation.all().count())
  end

  def test_delete_all()
    Presentation.delete_all()
    @presentation1.save()
    @presentation2.save()
    Presentation.delete_all()
    assert_equal(0, Presentation.all().count())
  end

end
