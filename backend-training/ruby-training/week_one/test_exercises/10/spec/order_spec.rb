# frozen_string_literal: true

require 'rspec'
require_relative '../lib/order'

describe Order do
  subject { order }
  let(:order) { Order.new }

  it 'initializes well' do
    expect(order.total_products).to eql 0
    expect(order.status).to eql 'incomplete'
  end

  it 'cart has products' do
    order.add_to_cart
    expect(order.total_products).to eql 1

    4.times { order.add_to_cart }
    expect(order.total_products).to eql 5
  end

  it 'when the total products is greater than 5 discount is 0.20' do
    6.times { order.add_to_cart }
    order.update_discount
    expect(order.discount).to eql 0.20
  end

  it 'when the total product  is lower than 5 discount is 0 ' do
    3.times { order.add_to_cart }
    order.update_discount
    expect(order.discount).to eql 0
  end

  it 'when the order is check out status is complete' do
    order.check_out
    expect(order.status).to eql 'complete'
  end
end
