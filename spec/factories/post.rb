FactoryGirl.define do
  factory :post do
    caption "nofilter"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/shot.png', 'image/png')
  end
end
