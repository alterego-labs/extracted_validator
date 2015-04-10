require 'spec_helper'
require 'active_record'

class AnotherPostValidator < ExtractedValidator::Base[Post]
  validates :title, presence: true
  validates_uniqueness_of :title
end

describe 'Model required usage' do
  subject(:validator) { AnotherPostValidator.new(post) }

  let(:post) { Post.new }

  context 'provides validations' do
    it { is_expected.to respond_to :valid? }

    its(:valid?) { is_expected.to be_falsey }
  end

  describe '.model_class' do
    it 'returns passed model class' do
      expect(validator.class.model_class).to eq Post
    end
  end

  context 'test uniqueness validation' do
    before do
      Post.create title: 'Some title'
    end

    let(:post) { Post.new(title: 'Some title') }

    its(:valid?) { is_expected.to be_falsey }
  end
end
