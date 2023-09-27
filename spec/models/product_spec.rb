require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { build(:product) }

  it 'valid objet' do
    expect(product).to be_valid
  end

  it 'status imported' do
    expect(product.status).to include("imported")
  end

end

