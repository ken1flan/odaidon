require 'ruboty'

module Ruboty
  module Handlers
    class Theme < Base
      on /give theme/i, name: :get, description: "お題を渡す"
      on /load themes/i, name: :load_from_file, description: "お題をロードする"

      def get(message)
        themes = message.robot.brain.data[:theme]
        themes ||= []
        theme = themes.sample(random: Random.new(Date.today.to_time.to_i))
        theme ||= 'empty'
        content = ("\"#{theme}\"\n#{hashtag}")
        message.reply(content)
      end

      def load_from_file(message)
        path = [File.expand_path('../', __FILE__), 'theme_list.txt'].join('/')
        file = File.open(path)
        themes = file.readlines.map(&:chomp)
        message.robot.brain.data[:theme] = themes
        message.reply("Loaded #{themes.count} themes.")
      end

      private
  
      def hashtag
        hashtag = ENV['ODAIDON_HASHTAG']
        hashtag ||= 'odaidon'
        "##{hashtag}"
      end
    end
  end
end
