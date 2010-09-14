# -*- coding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class Incognito
  include FullNameSplitter
  attr_accessor :first_name, :last_name
end

describe Incognito do
  describe "#full_name=" do

    #
    # Environment
    #

    subject { Incognito.new }

    def gum(first, last)
      "[#{first}] + [#{last}]"
    end


    #
    # Examples
    #

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
      "George H. W."                  => ["George H. W.",   nil                   ],
      "Van Helsing"                   => [nil,              "Van Helsing"         ],
      "d'Artagnan"                    => [nil,              "d'Artagnan"          ],
      "O'Connor"                      => [nil,              "O'Connor"            ],

      "George"                        => ["George",         nil                   ],
      "Kevin J. "                     => ["Kevin J.",       nil                   ],

      "Thomas G. Della Fave"          => ["Thomas G.",      "Della Fave"          ],
      "Anne du Bourg"                 => ["Anne",           "du Bourg"            ],

      # German
      "Johann Wolfgang von Goethe"    => ["Johann Wolfgang", "von Goethe"         ],

      # Spanish-speaking countries
      "Juan Martín de la Cruz Gómez"  => ["Juan Martín",    "de la Cruz Gómez"    ],
      "Javier Reyes de la Barrera"    => ["Javier",         "Reyes de la Barrera" ],
      "Rosa María Pérez Martínez Vda. de la Cruz" =>
                                         ["Rosa María",    "Pérez Martínez Vda. de la Cruz"],

      # Italian
      "Federica Pellegrini"           => ["Federica",       "Pellegrini"          ],
      "Leonardo da Vinci"             => ["Leonardo",       "da Vinci"            ],
      # sounds like a fancy medival action movie star pseudonim
      "Alberto Del Sole"              => ["Alberto",        "Del Sole"            ],
      # horror movie star pseudonim?
      "Adriano Dello Spavento"        => ["Adriano",        "Dello Spavento"      ],
      "Luca Delle Fave"               => ["Luca",           "Delle Fave"          ],
      "Francesca Della Valle"         => ["Francesca",      "Della Valle"         ],
      "Guido Delle Colonne"           => ["Guido",          "Delle Colonne"       ],
      "Tomasso D'Arco"                => ["Tomasso",        "D'Arco"              ],

      # Dutch
      "Johan de heer Van Kampen"      => ["Johan",          "de heer Van Kampen"  ],
      "Han Van De Casteele"           => ["Han",            "Van De Casteele"     ],
      "Han Vande Casteele"            => ["Han",            "Vande Casteele"      ],

      # Exceptions?
      # the architect Ludwig Mies van der Rohe, from the West German city of Aachen, was originally Ludwig Mies;
      "Ludwig Mies van der Rohe"      => ["Ludwig",         "Mies van der Rohe"   ],

      # If comma is provided then split by comma

      "John, Quincy Adams"             => ["John",    "Quincy Adams"              ],
      "Ludwig Mies, van der Rohe"      => ["Ludwig Mies", "van der Rohe"          ],

      # Test ignoring unnecessary whitespaces
      "\t Ludwig  Mies\t van der Rohe "   => ["Ludwig", "Mies van der Rohe"       ],
      "\t Ludwig  Mies,\t van  der Rohe " => ["Ludwig Mies", "van der Rohe"       ],
      "\t Ludwig      "                   => ["Ludwig", nil                       ],
      "  van  helsing "                   => [nil, "van helsing"                  ],
      " , van  helsing "                  => [nil, "van helsing"                  ],
      "\t Ludwig  Mies,\t van  der Rohe " => ["Ludwig Mies", "van der Rohe"       ],

    }.

    each do |full_name, split_name|
      it "should split #{full_name} to '#{split_name.first}' and '#{split_name.last}'" do
        subject.full_name = full_name
        gum(subject.first_name, subject.last_name).should == gum(*split_name)
      end

      it "should split #{full_name} to '#{split_name.first}' and '#{split_name.last}' when called as module function" do
        FullNameSplitter.split(full_name).should == split_name
      end

    end
  end
end
