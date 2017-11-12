require 'test_helper'

class ThemeTest < Minitest::Test
  def setup
    @robot = Ruboty::Robot.new
    @theme = Ruboty::Handlers::Theme.new(@robot)
  end

  def teardown
  end

  def test_reply_with_no_theme
    message = Ruboty::Message.new(body: "theme please", robot: @robot)
    assert_output("\"empty\"\n") { @theme.get(message) }
  end

  def test_reply_with_a_theme
    @robot.brain.data[:theme] = %w(ruboty)

    message = Ruboty::Message.new(body: "theme please", robot: @robot)
    assert_output("\"ruboty\"\n") { @theme.get(message) }
  end

  def test_get_with_2_themes
    t = Time.local(2017, 11, 12, 10, 11, 12)
    Timecop.travel(t)

    @robot.brain.data[:theme] = %w(ruby ruboty)
    message = Ruboty::Message.new(body: "theme please", robot: @robot)
    assert_output("\"ruby\"\n") { @theme.get(message) }

    t = Time.local(2017, 11, 12, 12, 13, 14)
    Timecop.travel(t)
    assert_output("\"ruby\"\n") { @theme.get(message) }

    t = Time.local(2017, 11, 11, 23, 57, 12)
    Timecop.freeze(t)

    message = Ruboty::Message.new(body: "theme please", robot: @robot)
    assert_output("\"ruboty\"\n") { @theme.get(message) }

    Timecop.return
  end
end