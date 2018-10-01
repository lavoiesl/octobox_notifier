require 'octobox_notifier'
require 'net/http'

module OctoboxNotifer
  module API
    def start(&block)
      Net::HTTP.start('octobox.shopify.io', 443, use_ssl: true, &block)
    end

    def get(url, headers = {})
      start do |http|
        resp = http.post(url, default_headers.merge(headers))
        raise(CLI::Kit::Abort, "Cannot access octobox: #{resp}") unless resp.code.to_i == 200
        resp
      end
    end

    def post(url, data, headers = {})
      start do |http|
        resp = http.post(url, data, default_headers.merge(headers))
        raise(CLI::Kit::Abort, "Cannot access octobox: #{resp}") unless resp.code.to_i == 200
        resp
      end
    end

    def default_headers
      headers = {
        'Authorization' => "Bearer #{OctoboxNotifer::Config.token}",
        "X-Octobox-API" => "1",
      }
    end
  end
end
