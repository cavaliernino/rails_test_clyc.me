module Fancy
	def createfancy
		@fancifier = MakeFancy.new(self.title)
		@fancifier.palindrome
	end

	class MakeFancy

		def initialize(fancy)
			@title = fancy
		end

	end
	
end
