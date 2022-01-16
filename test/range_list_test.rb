require "test/unit"
require_relative '../range_list'

class RangeListTest < Test::Unit::TestCase
  
  def test_range_list_new
    assert(RangeList.new.range_size.zero?)
    assert(RangeList.new.range_lists_string.empty?)
  end

  test "add [1,5]" do 
    rl = RangeList.new
    assert_equal(0, rl.range_size)

    rl.add([1, 5])
    assert_equal(1, rl.range_size)
    assert_equal("[ 1, 5 ) ", rl.print)
  end

  test "add [1,5], [10,20]" do
    rl = RangeList.new
    assert_equal(0, rl.range_size)

    rl.add([1, 5])
    assert_equal(1, rl.range_size)
    assert_equal("[ 1, 5 ) ", rl.print)

    rl.add([10, 20])
    assert_equal(2, rl.range_size)
    assert_equal("[ 1, 5 ) [ 10, 20 ) ", rl.print)
  end

  test "add [1,5], [10,20] [2,4]" do
    rl = RangeList.new
    assert_equal(0, rl.range_size)

    rl.add([1, 5])
    assert_equal(1, rl.range_size)
    assert_equal("[ 1, 5 ) ", rl.print)

    rl.add([10, 20])
    assert_equal(2, rl.range_size)
    assert_equal("[ 1, 5 ) [ 10, 20 ) ", rl.print)

    rl.add([2, 4])
    assert_equal(2, rl.range_size)
    assert_equal("[ 1, 5 ) [ 10, 20 ) ", rl.print)
  end

  test "add [1,5], [10,20] [2,4] [1,7]" do
    rl = RangeList.new
    assert_equal(0, rl.range_size)

    rl.add([1, 5])
    assert_equal(1, rl.range_size)
    assert_equal("[ 1, 5 ) ", rl.print)

    rl.add([10, 20])
    assert_equal(2, rl.range_size)
    assert_equal("[ 1, 5 ) [ 10, 20 ) ", rl.print)

    rl.add([2, 4])
    assert_equal(2, rl.range_size)
    assert_equal("[ 1, 5 ) [ 10, 20 ) ", rl.print)

    rl.add([1, 7])
    assert_equal(2, rl.range_size)
    assert_equal("[ 1, 7 ) [ 10, 20 ) ", rl.print)
  end

  test "add [1,5], [10,20] [2,4] [1,7] [25,30]" do
    rl = RangeList.new
    assert_equal(0, rl.range_size)

    rl.add([1, 5])
    assert_equal(1, rl.range_size)
    assert_equal("[ 1, 5 ) ", rl.print)

    rl.add([10, 20])
    assert_equal(2, rl.range_size)
    assert_equal("[ 1, 5 ) [ 10, 20 ) ", rl.print)

    rl.add([2, 4])
    assert_equal(2, rl.range_size)
    assert_equal("[ 1, 5 ) [ 10, 20 ) ", rl.print)

    rl.add([1, 7])
    assert_equal(2, rl.range_size)
    assert_equal("[ 1, 7 ) [ 10, 20 ) ", rl.print)

    rl.add([25, 30])
    assert_equal(3, rl.range_size)
    assert_equal("[ 1, 7 ) [ 10, 20 ) [ 25, 30 ) ", rl.print)
  end
end