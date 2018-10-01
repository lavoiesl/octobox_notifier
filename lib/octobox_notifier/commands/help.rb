require 'octobox_notifier'

module OctoboxNotifier
  module Commands
    class Help < OctoboxNotifier::Command
      def call(args, _name)
        puts CLI::UI.fmt("{{bold:Available commands}}")
        puts ""

        OctoboxNotifier::Commands::Registry.resolved_commands.each do |name, klass|
          next if name == 'help'
          puts CLI::UI.fmt("{{command:#{OctoboxNotifier::TOOL_NAME} #{name}}}")
          if help = klass.help
            puts CLI::UI.fmt(help)
          end
          puts ""
        end
      end
    end
  end
end
