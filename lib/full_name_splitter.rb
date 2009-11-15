# requires full accessable first_name and last_name attributes
module FullNameSplitter

  PREFIXES = %w(de la du del dei della degli van der mc ben).freeze

  class Splitter
    
    def initialize(full_name)
      @full_name  = full_name
      @first_name = []
      @last_name  = []
      split!
    end

    def split!
      @units = @full_name.split(/\s+/)
      while @unit = @units.shift do
        if prefix? or with_apostrophe? or (first_name? and last_unit? and not initial?)
          @last_name << @unit and break
        else
          @first_name << @unit
        end
      end
      @last_name += @units

      adjust_exceptions!
    end

    def first_name
      @first_name.empty? ? nil : @first_name.join(' ')
    end

    def last_name
      @last_name.empty? ? nil : @last_name.join(' ')
    end

    private

    def prefix?
      PREFIXES.include?(@unit.downcase)
    end

    # M or W.
    def initial?
      @unit =~ /^\w\.?$/
    end

    # O'Connor, d'Artagnan match
    # Noda' doesn't match
    def with_apostrophe?
      @unit =~ /\w{1}'\w+/
    end
    
    def last_unit?
      @units.empty?
    end
    
    def first_name?
      not @first_name.empty?
    end
    
    def adjust_exceptions!
      # Adjusting exceptions like "Ludwig Mies van der Rohe" => ["Ludwig", "Mies van der Rohe"]
      @last_name.unshift @first_name.pop if @last_name.join(' ') =~ /^van der/
    end
  end
  
  def full_name
    [first_name, last_name].compact.join(' ')
  end
  
  def full_name=(name)
    self.first_name, self.last_name = split(name)
  end
  
  private 
  
  def split(name)
    if name.include?(',')
      name.split(/\s*,\s*/, 2)
    else
      splitter = Splitter.new(name)
      [splitter.first_name, splitter.last_name]
    end
  end
  
  module_function :split
end