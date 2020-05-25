class Post < ApplicationRecord
  has_one_attached :photo
  belongs_to :color, optional: true

  def palindrome
    title + title.reverse
  end

  def palindrome?
    title == title.reverse
  end

  def longest_palindrome(string = title, size = title.size)
    string.size.times do |init|
      break if init + size > string.size

      reversed_string = string[init, size].reverse
      return false if size < 2
      if string[init, size].eql? reversed_string
        return 'longest palindrome: ' + reversed_string + ' .'
      end
    end
    longest_palindrome(string, size - 1)
  end

  def color_code
    '#FF0000'
  end
end
