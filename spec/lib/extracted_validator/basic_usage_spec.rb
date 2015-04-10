require 'spec_helper'
require 'active_record'

class PostValidator < ExtractedValidator::Base
  validate :title_for_blank

  def title_for_blank
    add_error('Title must be set!') if title.blank?
  end
end

class Post < ActiveRecord::Base
end

describe 'Basic usage' do
  subject(:validator) { PostValidator.new(post) }

  let(:post) { Post.new }

  context 'provides validations' do
    it { is_expected.to respond_to :valid? }

    its(:valid?) { is_expected.to be_falsey }
  end
end
