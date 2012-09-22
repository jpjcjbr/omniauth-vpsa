require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Vpsa < OmniAuth::Strategies::OAuth2

      # Possible scopes: userinfo.email,userinfo.profile,plus.me
      DEFAULT_SCOPE = "all"

      option :name, 'vpsa'
      option :authorize_options, [:app_id, :redirect_uri]
      option :provider_ignores_state, :true

      option :client_options, {
        :site          => 'https://www.vpsa.com.br',
        :authorize_url => '/apps/oauth/authorization?response_type=code',
        :token_url     => '/apps/oauth/token'
      }

      def request_phase
        redirect client.auth_code.authorize_url({:redirect_uri => options.redirect_uri }.merge(options.authorize_params)).gsub("client_id", "app_id")
      end

      info do
        prune!({
          :cnpj_empresa => raw_info['cnpj_empresa'],
          :id_terceiro => raw_info['id_terceiro'],
          :nome_terceiro  => raw_info['nome_terceiro']
        })
      end

      def raw_info
        @raw_info ||= build_access_token
      end

      private

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end

module OAuth2
  class Client
    def get_token(params, access_token_opts={})
      opts = {:raise_errors => options[:raise_errors], :parse => params.delete(:parse)}
      if options[:token_method] == :post
        headers = params.delete(:headers)
        opts[:body] = params.to_json
        opts[:headers] =  {'Content-Type' => 'application/json'}
        opts[:headers].merge!(headers) if headers
      else
        opts[:params] = params
      end

      response = request(options[:token_method], token_url, opts)
      raise Error.new(response) if options[:raise_errors] && !(response.parsed.is_a?(Hash) && response.parsed['access_token'])
      AccessToken.from_hash(self, response.parsed.merge(access_token_opts))
    end
  end

  module Strategy
    class Base
      def client_params
        {'app_id' => @client.id, 'app_secret' => @client.secret}
      end
    end
  end
end