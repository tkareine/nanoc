# encoding: utf-8

class Nanoc::CLI::Commands::CompileTest < Nanoc::TestCase

  def test_profiling_information
    with_site do |site|
      Nanoc::CLI.run %w( create_item foo )
      Nanoc::CLI.run %w( create_item bar )
      Nanoc::CLI.run %w( create_item baz )

      File.open('Rules', 'w') do |io|
        io.write "compile '*' do\n"
        io.write "  filter :erb\n"
        io.write "end\n"
        io.write "\n"
        io.write "route '*' do\n"
        io.write "  if item.binary?\n"
        io.write "    item.identifier.chop + '.' + item[:extension]\n"
        io.write "  else\n"
        io.write "    item.identifier + 'index.html'\n"
        io.write "  end\n"
        io.write "end\n"
        io.write "\n"
        io.write "layout '*', :erb\n"
      end

      Nanoc::CLI.run %w( compile --verbose )
    end
  end

end
