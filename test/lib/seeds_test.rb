class SeedsTest < ActiveSupport::TestCase
  test 'does not raise errors' do
    assert_nothing_raised do
      seeds = Seeds.new

      seeds.flushdb
      seeds.perform
    end
  end
end
