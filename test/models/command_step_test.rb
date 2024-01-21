require 'test_helper'

class CommandStepTest < ActiveSupport::TestCase
  test 'has valid factories' do
    FactoryBot.factories[:command_step].defined_traits.each do |trait|
      assert_predicate build(:command_step, trait.name), :valid?
    end
  end

  test 'invalid properties' do
    assert_not build(:command_step, properties: { lol: 'nop' }).valid?
  end
end
