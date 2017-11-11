require 'ruboty'

module Ruboty
  module Handlers
    class Theme < Base
      on /theme/i, name: :call, description: "お題を渡す"

      def call(message)
        theme = 'theme'
        message.reply("\"#{theme}\"")
      end
    end
  end
end