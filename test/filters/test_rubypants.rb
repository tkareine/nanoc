# encoding: utf-8

class Nanoc::Filters::RubyPantsTest < Nanoc::TestCase

  def test_filter
    if_have 'rubypants' do
      # Get filter
      filter = ::Nanoc::Filters::RubyPants.new

      # Run filter
      result = filter.run("Wait---what?")
      assert_equal("Wait&#8212;what?", result)
    end
  end

end
