require 'test_helper'

class IssueTest < Minitest::Test
  def setup
    @robot = Ruboty::Robot.new
    @theme = Ruboty::Handlers::Theme.new(@robot)
  end

  def test_reply_with_issue
    message = Ruboty::Message.new(body: "theme please", robot: @robot)
    assert_output("\"theme\"\n") { @theme.call(message) }
  end
end