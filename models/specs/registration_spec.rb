require("minitest/autorun")
require_relative("../registration.rb")

class TestRegistration < MiniTest::Test

  def setup()
    options1 = {"id" => 1, "presentation_id" => 4, "delegate_id" => 6}
    @registration1 = Registration.new(options1
    options2 = {"id" => 2, "presentation_id" => 2, "delegate_id" => 3}
    @registration2 = Registration.new(options2)
  end

  def test_setup()
    assert_equal(4, @registration1.presentation_id)
    assert_equal(6, @registration1.delegate_id)
  end

  def test_save()
    @registration1.save()
    assert_equal(4, @registration1.presentation_id)
  end

  # def test_all()
  #
  # end

end
