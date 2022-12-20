# frozen_string_literal: true

require 'securerandom'
require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title).with_message('не может быть пустым') }
    it { should validate_presence_of(:description).with_message('не может быть пустым') }
    it { should validate_presence_of(:price).with_message('не может быть пустым') }

    context 'when title - invalid' do
      it { should_not allow_value(Faker::Lorem.word).for(:title) }
    end

    context 'when address - valid' do
      it { should allow_value([*'А'..'Я', *'а'..'я', *(0..10)].shuffle[10..100].join).for(:title) }
    end

    context 'when description - invalid' do
        it { should_not allow_value(Faker::Lorem.word).for(:description) }
      end
  
      context 'when description is short' do
        it { should_not allow_value([*'А'..'Я', *'а'..'я'].shuffle[1..9].join).for(:description) }
      end
  
      context 'when description is normal length but invalid letters' do
        it { should_not allow_value(SecureRandom.alphanumeric(15)).for(:description) }
      end
  
      context 'when description - valid' do
        it { should allow_value([*'А'..'Я', *'а'..'я', *(0..10)].shuffle[10..100].join).for(:description) }
      end

      context 'when price - invalid' do
        it { should_not allow_value(rand(-100..0).to_s).for(:price) }
      end
  
      context 'when price - valid' do
        it { should allow_value(rand(1..1000)).for(:price) }
      end
  
      context 'when price - has not only numbers' do
        it { should_not allow_value(SecureRandom.base64).for(:price) }
      end
    
  end
end
