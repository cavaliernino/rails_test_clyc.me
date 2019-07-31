require 'rails_helper'
require 'fancifier'

RSpec.describe Fancifier do

	let(:color) { Fancifier.new(title: "Blue Phase") }

	it 'responds with blue by calling a blue method' do
		expect(color.blue).to eq('#0000FF')
	end

	it 'responds to red by calling a red method' do
		expect(color.red).to eq('#FF0000')
	end
end
