# requires full accessable first_name and last_name attributes
module FullNameSplitter
  
  PREFIXES = %w(de la du del dei della degli van der mc ben).freeze
  
  def full_name
    [first_name, last_name].compact.join(' ')
  end
  
  def full_name=(name)
    self.first_name, self.last_name = split_full_name(name)
  end
  
  def split_full_name(name)
    items = name.split(/\s+/)
    first_name, last_name = [], []

    while candidate = items.shift do
      if prefix?(candidate) || name_with_apostrophe?(candidate) || !initial?(candidate) && !first_name.empty? && items.empty?
        last_name << candidate and break
      else
        first_name << candidate
      end
    end

    last_name += items

    # Handling exceptions like "Ludwig Mies van der Rohe" => ["Ludwig", "Mies van der Rohe"]
    last_name.unshift first_name.pop if last_name.join(' ') =~ /^van der/
    
    [first_name.join(' '), last_name.join(' ')]
  end

  module_function :split_full_name
  
  private
  
  def prefix?(candidate)
    PREFIXES.include?(candidate.downcase)
  end
  
  def initial?(candidate) # W or W.
    candidate.size == 1 || candidate.size == 2 && candidate[1..1] == '.'
  end
  
  # O'Connor, d'Artagnan match
  # Noda' doesn't match
  def name_with_apostrophe?(candidate)
    candidate =~ /\w{1}'\w+/
  end
end