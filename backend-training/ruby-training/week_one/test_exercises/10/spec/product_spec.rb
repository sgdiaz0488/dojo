# frozen_string_literal: true

require 'rspec'
require_relative '../lib/product'

describe Product do
  subject { product }
  let(:product) { Product.new('Soap', 30) }

  it 'belongs to a class Product' do
    expect(product.read_product_info).to eql 'Soap currently costs 30'
  end

  it 'have a review' do
    product.add_review('This soap is good!!!')
    expect(product.reviews.count).to eql 1
  end

  it 'have a review with a valid content' do
    product.add_review('This soap is good!!!')
    expect(product.reviews.first).to eql 'This soap is good!!!'
  end

  it 'when read the reviews and reliability is strong' do
    15.times do |i|
      product.add_review("Review #{i}")
    end
    expect(product.read_reviews).to eql 'strong'
  end

  it 'when read the reviews and reliability is okay' do
    8.times do |i|
      product.add_review("Review #{i}")
    end
    expect(product.read_reviews).to eql 'okay'
  end

  it 'when read the reviews and reliability is weak' do
    3.times do |i|
      product.add_review("Review #{i}")
    end
    expect(product.read_reviews).to eql 'weak'
  end
end
