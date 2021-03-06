require 'coin'
require 'sym/app/password/providers'

module Sym
  module App
    module Password
      module Providers
        class DrbProvider

          attr_accessor :coin

          def initialize
            Coin.uri  = Sym::Configuration.config.password_cache_arguments[:drb][:opts][:uri]
            self.coin = Coin
          end

          def alive?
            self.read('bogus') rescue nil
            self.coin.server_running?
          end

          def write(*args)
            coin.server.send(:write, *args)
          end

          def read(*args)
            coin.send(:read, *args)
          end
        end

        register DrbProvider
      end
    end
  end
end
