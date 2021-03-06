require 'action_controller'
require 'action_view'

module SpgatewayRails

	def self.config
		@@config ||= Configuration.new
	end

	def self.configure
		yield config
	end

	def self.get_error_message code
		# @@error_codes ||= ErrorCodes.new
		ErrorCodes.error_codes[code.to_sym]
	end
end

require 'spgateway_rails/version'
require 'spgateway_rails/configuration'
require 'spgateway_rails/error_codes'
require 'spgateway_rails/controller_helper'
require 'spgateway_rails/view_helper'
require 'spgateway_rails/spgateway_helper'
require 'spgateway_rails/spgateway_params'
require 'spgateway_rails/spgateway_result'
require 'spgateway_rails/periodical/spgateway_periodical'
require 'spgateway_rails/periodical/periodical_result'
require 'spgateway_rails/mpg/spgateway_mpg'

ActionController::Base.send :include, SpgatewayRails::ControllerHelper
ActionView::Base.send :include, SpgatewayRails::ViewHelper