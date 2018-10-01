require 'octobox_notifier'

module OctoboxNotifier
  Config = CLI::Kit::Config.new(tool_name: OctoboxNotifier::TOOL_NAME)
  class << Config
    def token
      token, _, t = CLI::Kit::System.capture3('security', 'find-generic-password', '-w', '-l', 'octobox-token')
      raise(CLI::Kit::Abort, "Could not retrieve your octobox token.") unless t.success?
      token
    end
  end
end
