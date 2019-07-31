require 'rails_helper'
require 'fancifier'

RSpec.describe "Fancifier", type: :feature do
	fixtures :colors, :posts

	it 'makes a word into a palindrome' do
		
		visit '/posts/new'
		fill_in 'Title', :with => 'Word'
		click_button 'Create Post'	
		expect(page).to have_content("WorddroW")

	end
	
	it 'detects a palindrome' do
		
		visit '/posts/new'
		fill_in 'Title', :with => 'TesttesT'
		click_button 'Create Post'	
		expect(page).to have_content("true")

	end

	it 'detects the largest palindrome' do
		
		visit '/posts/new'
		fill_in 'Title', :with => '5343321212212124'
		click_button 'Create Post'	
		expect(page).to have_content(" 2121221212 ")

	end

	it 'changes the color to red' do
		visit '/posts/new'
		fill_in 'Title', :with => 'Red Title'
		page.select 'Red'
		click_button 'Create Post'	
		expect(page.html).to include('#FF0000')
	end



end

