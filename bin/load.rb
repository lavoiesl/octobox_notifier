Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

unshift_path = ->(path) {
  p = File.expand_path("../../#{path}", __FILE__)
  $LOAD_PATH.unshift(p) unless $LOAD_PATH.include?(p)
}
unshift_path.call('vendor/deps/cli-ui/lib')
unshift_path.call('vendor/deps/cli-kit/lib')
unshift_path.call('vendor/terminal-notifier/lib')
unshift_path.call('lib')

require 'octobox_notifier'

