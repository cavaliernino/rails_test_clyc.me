require 'fancy'

class Fancifier
	include Fancy
	attr_accessor :title

	def initialize(title)
		@title = title
	end

	def method_missing(name, *args, &block)
		caps_name = name.slice(0,1).capitalize + name.slice(1..-1)
		Color.find(name: caps_name).code
	end

	def respond_to_missing(name, *args)
		name = name || super
	end
end


