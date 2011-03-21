# encoding: utf-8

class Nanoc::ChecksumStoreTest < MiniTest::Unit::TestCase

  include Nanoc::TestHelpers

  def setup
    super

    @site = mock
    config = { :tmp_dir => 'tmp' }
    @site.stubs(:config).returns(config)
    @store = Nanoc::ChecksumStore.new(@site)
  end

  def test_get_with_existing_object
    require 'pstore'

    # Create store
    FileUtils.mkdir_p(File.dirname(@store.filename))
    pstore = PStore.new(@store.filename)
    pstore.transaction do
      pstore[:data] = { [ :item, '/moo/' ] => 'zomg' }
      pstore[:version] = 1
    end

    # Check
    @store.load
    obj = Nanoc::Item.new('Moo?', {}, '/moo/')
    assert_equal 'zomg', @store[obj]
  end

  def test_get_with_nonexistant_object
    @store.load

    # Check
    obj = Nanoc::Item.new('Moo?', {}, '/animals/cow/')
    new_checksum = 'Moo?'.checksum + '-' + {}.checksum
    assert_equal nil, @store[obj]
  end

end
