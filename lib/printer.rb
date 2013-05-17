class Printer
  attr_accessor :title

  def initialize(title)
    @title = title
  end

  def print_flag
      title.split.map{|w|
        puts (0..2).map{|l|
          w.chars.map{|c|
            (' '*576+'CAEAEADBCAF DAEBDACAAAI EAFADACAABG BAEAFEL A_ FACABADADAAG AAFBADQ AGX GAFADABAAAAF'.split.zip('\\|/-o-/|\\'.chars).map{|a,c|
              (a.chars.zip([' ',c]*9).map{|x,z|
                [z]*(x.ord-64)}.flatten)}.transpose*''*2)[c.ord*9+3*l,3]}*' '},''
      }
  end
end