require 'ruboty'

module Ruboty
  module Handlers
    class Parrot < Base
      on /parrot/i, name: :call, description: "オウム返し"

      def command_name
        'parrot'
      end

      def call(message)
        name = message.robot.name
        text = message.body
        text.gsub!(/^\s*@?#{name}\s*#{command_name}\s*(.*)/) { $1 }
        message.reply("You said \"#{text}\"")
      end
    end
  end
end