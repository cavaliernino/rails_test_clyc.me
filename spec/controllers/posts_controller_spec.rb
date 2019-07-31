require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it 'attaches the uploaded file' do
    file = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
    expect {
		post :create, params: { post: { photo: file } }
    }.to change(ActiveStorage::Attachment, :count).by(1)
  end
end
