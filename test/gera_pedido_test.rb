require "test/unit"
require "hello_world" # Added

class HelloWorldTest < Test::Unit::TestCase
  def test_say_hello_to_the_world
    assert_equal "Hello World!", HelloWorld.say
  end
end
