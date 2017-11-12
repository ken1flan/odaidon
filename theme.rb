require 'ruboty'

module Ruboty
  module Handlers
    class Theme < Base
      on /theme/i, name: :get, description: "お題を渡す"

      def get(message)
        themes = message.robot.brain.data[:theme]
        themes ||= []
        theme = themes.sample(random: Random.new(Date.today.to_time.to_i))
        theme ||= 'empty'
        message.reply("\"#{theme}\"")
      end
    end
  end
end