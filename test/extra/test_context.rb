# encoding: utf-8

require 'test/helper'

class Nanoc3::Extra::ContextTest < MiniTest::Unit::TestCase

  include Nanoc3::TestHelpers

  def test_context_with_instance_variable
    # Create context
    context = Nanoc3::Extra::Context.new({ :foo => 'bar', :baz => 'quux' })

    # Ensure correct evaluation
    assert_equal('bar', eval("@foo", context.get_binding))
  end

  def test_context_with_instance_method
    # Create context
    context = Nanoc3::Extra::Context.new({ :foo => 'bar', :baz => 'quux' })

    # Ensure correct evaluation
    assert_equal('bar', eval("foo", context.get_binding))
  end

  def test_example
    # Parse
    YARD.parse('../lib/nanoc3/extra/context.rb')

    # Run
    assert_examples_correct 'Nanoc3::Extra::Context#initialize'
  end

end
