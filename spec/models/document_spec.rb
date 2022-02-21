require 'rails_helper'

RSpec.describe Document, type: :model do
  subject(:document) { Document.new }

  it 'new Record object' do   
    expect(document).to be_a_new(Document)
  end

  it 'user_id is nil' do
    expect(document.user_id).to be(nil)
  end

  it 'key is nil' do
    expect(document.key).to be(nil)
  end

  it 'shared is nil' do
    expect(document.shared).to be(false)
  end
end
