require 'test_helper'

class ParrotTest < Minitest::Test
  def setup
    @robot = Ruboty::Robot.new
    @parrot = Ruboty::Handlers::Parrot.new(@robot)
  end

  def test_reply_without_robotname_and_command
    message = Ruboty::Message.new(body: "#{@robot.name} parrot Hello!", robot: @robot)
    assert_output("You said \"Hello!\"\n") { @parrot.call(message) }
  end
end