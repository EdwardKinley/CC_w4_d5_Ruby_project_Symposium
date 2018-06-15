require("minitest/autorun")
require_relative("../registration.rb")

class TestRegistration < MiniTest::Test

  def setup()
    options = {"id" => 1, "presentation_id" => 4, "delegate_id" => 6}
    @registration1 = Registration.new(options)
  end

  def test_setup()
    assert_equal(4, @registration1.presentation_id)
    assert_equal(6, @registration1.delegate_id)
  end



end
