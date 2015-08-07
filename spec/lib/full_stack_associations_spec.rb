require 'spec_helper'

class FullStackCommentValidator < ExtractedValidator::Base[Comment]
  validates :body, presence: true
end

class FullStackArticleValidator < ExtractedValidator::Base[Article]
  validates :title, presence: true

  validating :comments, by: FullStackCommentValidator
end

describe 'Full stack associations' do
  subject(:validator) { FullStackArticleValidator.new(article) }

  let(:article) { Article.new(title: title) }

  before do
    article.comments.build body: body
  end

  context 'when main model is valid' do
    let(:title) { 'Some title' }

    context 'and associated model is valid' do
      let(:body) { 'Some comment body' }

      its(:valid?) { is_expected.to be_truthy }
    end

    context 'and associated model is invalid' do
      let(:body) { nil }

      its(:valid?) { is_expected.to be_falsey }
    end
  end

  context 'when main model is not valid' do
    let(:title) { nil }

    context 'and associated model is valid' do
      let(:body) { 'Some comment body' }

      its(:valid?) { is_expected.to be_falsey }
    end

    context 'and associated model is invalid' do
      let(:body) { nil }

      its(:valid?) { is_expected.to be_falsey }
    end
  end
end
