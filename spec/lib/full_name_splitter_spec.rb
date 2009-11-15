require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class Incognito
  include FullNameSplitter
  attr_accessor :first_name, :last_name
end

describe Incognito do
  describe "#full_name=" do
    before(:each) do
      @incognito = Incognito.new
    end

    def gum(first, last)
      "[#{first}] + [#{last}]"
    end

    {
      "John Smith"                    => ["John",           "Smith"               ],
      
      "Kevin J. O'Connor"             => ["Kevin J.",       "O'Connor"            ],
      "Gabriel Van Helsing"           => ["Gabriel",        "Van Helsing"         ],
      "Pierre de Montesquiou"         => ["Pierre",         "de Montesquiou"      ],
      "Charles d'Artagnan"            => ["Charles",        "d'Artagnan"          ],
      "Jaazaniah ben Shaphan"         => ["Jaazaniah",      "ben Shaphan"         ],
      "Noda' bi-Yehudah"              => ["Noda'",          "bi-Yehudah"          ],
      "Maria del Carmen Menendez"     => ["Maria",          "del Carmen Menendez" ],
      "Alessandro Del Piero"          => ["Alessandro",     "Del Piero"           ],

      "George W Bush"                 => ["George W",       "Bush"                ],
      "George H. W. Bush"             => ["George H. W.",   "Bush"                ],
      "James K. Polk"                 => ["James K.",       "Polk"                ],
      "William Henry Harrison"        => ["William Henry",  "Harrison"            ],
      "John Quincy Adams"             => ["John Quincy",    "Adams"               ],
      
      "John Quincy"                   => ["John",           "Quincy"              ],
      "George H. W."                  => ["George H. W.",   ""                    ],
      "Van Helsing"                   => ["",               "Van Helsing"         ],
      "d'Artagnan"                    => ["",               "d'Artagnan"          ],
      "O'Connor"                      => ["",               "O'Connor"            ],
      
      "George"                        => ["George",         ""                    ],
      "Kevin J. "                     => ["Kevin J.",       ""                    ],
      
      "Thomas G. Della Fave"          => ["Thomas G.",      "Della Fave"          ],
      "Anne du Bourg"                 => ["Anne",           "du Bourg"            ],
      "Juan Martín de la Cruz Gómez"  => ["Juan Martín",    "de la Cruz Gómez"    ],
      
      
      # Exceptions?
      # the architect Ludwig Mies van der Rohe, from the West German city of Aachen, was originally Ludwig Mies;
      "Ludwig Mies van der Rohe"      => ["Ludwig",         "Mies van der Rohe"   ],
    }.
    
    each do |full_name, split_name|
      it "should split #{full_name} to '#{split_name.first}' and '#{split_name.last}'" do
        @incognito.full_name = full_name
        gum(@incognito.first_name, @incognito.last_name).should == gum(*split_name)
      end
      
      it "should split #{full_name} to '#{split_name.first}' and '#{split_name.last}' by calling as module function" do
        FullNameSplitter.split(full_name).should == split_name
      end
      
    end
  end
end