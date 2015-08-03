require 'spec_helper'

class AttrPresenceSpec < ExtractedValidator::Base[User]
  validates :password, presence: true
end

describe 'Testing presence validation' do
  subject(:validator) { AttrPresenceSpec.new(user) }

  context 'when attr value is not set' do
    let(:user) { User.new }

    its(:valid?) { is_expected.to be_falsey }
  end

  context 'when attr value is set' do
    let(:user) { User.new(password: 'some text') }

    its(:valid?) { is_expected.to be_truthy }
  end
end
