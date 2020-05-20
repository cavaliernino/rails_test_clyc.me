class Post < ApplicationRecord
  has_one_attached :photo

  def palindrome
    self.title += self.title.reverse
  end
end
