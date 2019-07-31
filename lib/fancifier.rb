require 'fancy'

class Fancifier
	include Fancy
	attr_accessor :title

	def initialize(title)
		@title = title
	end

	def method_missing(name, *args, &block)
	end

	def respond_to_missing(name, *args)
		name = name || super
	end
end


