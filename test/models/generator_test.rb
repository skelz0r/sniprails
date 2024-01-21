require 'test_helper'

class GeneratorTest < ActiveSupport::TestCase
  test 'has valid factories' do
    assert_predicate build(:generator), :valid?
  end
end
