require './app/models/condition'
require './spec/spec_helper'

RSpec.describe Condition do
  it('has data'){ expect(Condition.dashboard_data).to be_a(Hash) }
end
