require './spec/spec_helper'
require './app/models/condition'

RSpec.describe Condition do
  it('has data'){ expect(Condition.dashboard_data).to be_a(Hash) }
end
