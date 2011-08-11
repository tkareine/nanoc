# encoding: utf-8

class Nanoc::Filters::RDocTest < Nanoc::StubSharedSiteConfigTestCase

  def test_filter
    if_have 'rdoc' do
      # Get filter
      filter = ::Nanoc::Filters::RDoc.new

      # Run filter
      result = filter.run("= Foo")
      assert_match(%r{<h1>Foo</h1>\Z}, result)
    end
  end

end
