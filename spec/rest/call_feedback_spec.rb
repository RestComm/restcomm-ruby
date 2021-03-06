require 'spec_helper'

describe Restcomm::REST::Feedback do
  before do
    @call = Restcomm::REST::Call.new('someUri', 'someClient')
  end

  it 'sets up a feedback resources object' do
    expect(@call).to respond_to(:feedback)
    expect(@call.feedback.instance_variable_get('@path')).to eq('someUri/Feedback')
  end
end
