require 'test_helper'

class ThemeTest < Minitest::Test
  def setup
    @robot = Ruboty::Robot.new
    @theme = Ruboty::Handlers::Theme.new(@robot)
  end

  def test_reply_with_no_theme
    message = Ruboty::Message.new(body: "give theme", robot: @robot)
    assert_output("\"empty\"\n#odaidon\n") { @theme.get(message) }
  end

  def test_reply_with_a_theme
    @robot.brain.data[:theme] = %w(ruboty)

    message = Ruboty::Message.new(body: "give theme", robot: @robot)
    assert_output("\"ruboty\"\n#odaidon\n") { @theme.get(message) }
  end

  def test_get_with_2_themes
    t = Time.local(2017, 11, 12, 10, 11, 12)
    Timecop.travel(t)

    @robot.brain.data[:theme] = %w(ruby ruboty)
    message = Ruboty::Message.new(body: "give theme", robot: @robot)
    assert_output("\"ruby\"\n#odaidon\n") { @theme.get(message) }

    t = Time.local(2017, 11, 12, 12, 13, 14)
    Timecop.travel(t)
    assert_output("\"ruby\"\n#odaidon\n") { @theme.get(message) }

    t = Time.local(2017, 11, 11, 23, 57, 12)
    Timecop.freeze(t)

    message = Ruboty::Message.new(body: "give theme", robot: @robot)
    assert_output("\"ruboty\"\n#odaidon\n") { @theme.get(message) }

    Timecop.return
  end

  def test_load_themes
    message = Ruboty::Message.new(body: "load themes", robot: @robot)
    assert_output("Loaded 194 themes.\n") { @theme.load_from_file(message) }
  end
end