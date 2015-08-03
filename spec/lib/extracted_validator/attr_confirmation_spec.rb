require 'spec_helper'

class AttrConfirmationSpecValidator < ExtractedValidator::Base[User]
  delegate :password_confirmation, to: :model
  delegate :password_confirmation=, to: :model

  validates :password, confirmation: true
end

describe 'Testing confirmation validation' do
  subject(:validator) { AttrConfirmationSpecValidator.new(user_params) }

  context 'when original attr value equals confirmation' do
    let(:user_params) { User.new(password: 'some_password', password_confirmation: 'some_password') }

    its(:valid?) { is_expected.to be_truthy }
  end

  context 'when original attr value not equals confirmation' do
    let(:user_params) { User.new(password: 'some_password', password_confirmation: 'some_another_password') }

    its(:valid?) { is_expected.to be_falsey }
  end
end
