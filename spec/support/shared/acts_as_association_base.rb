RSpec.shared_examples 'acts as association base' do
  it { is_expected.to respond_to :validate }
end
