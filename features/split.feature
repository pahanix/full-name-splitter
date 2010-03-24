Feature: Split given full name
  In order to split full name into first name and last name
  As a full name holder
  I want to get first name and last name
  
  Scenario Outline: American/European
    Given Incognito instance object
    When I assign <full_name> to incognito
    Then he should have a <first_name> and a <last_name>

    Examples:
      | full_name                                 | first_name        |last_name                        |
      | John Smith                                | John              | Smith                           |
      | Kevin J. O'Connor                         | Kevin J.          | O'Connor                        |
      | George W Bush                             | George W          | Bush                            |
      | George H. W. Bush                         | George H. W.      | Bush                            |
      | James K. Polk                             | James K.          | Polk                            |
      | William Henry Harrison                    | William Henry     | Harrison                        |
      | John Quincy Adams                         | John Quincy       | Adams                           |
      | John Quincy                               | John              | Quincy                          |

    Scenario Outline: French
      Given Incognito instance object
      When I assign <full_name> to incognito
      Then he should have a <first_name> and a <last_name>

      Examples:
        | full_name                                 | first_name        | last_name                       |
        | Pierre de Montesquiou                     | Pierre            | de Montesquiou                  |
        | Charles d'Artagnan                        | Charles           | d'Artagnan                      |
        | Anne du Bourg                             | Anne              | du Bourg                        |

    Scenario Outline: Italian
      Given Incognito instance object
      When I assign <full_name> to incognito
      Then he should have a <first_name> and a <last_name>

      Examples:
        | full_name                                 | first_name        | last_name                       |
        | Maria del Carmen Menendez                 | Maria             | del Carmen Menendez             |
        | Alessandro Del Piero                      | Alessandro        | Del Piero                       |
        | Thomas G. Della Fave                      | Thomas G.         | Della Fave                      |
        | Federica Pellegrini                       | Federica          | Pellegrini                      |
        | Leonardo da Vinci                         | Leonardo          | da Vinci                        |
        | Alberto Del Sole                          | Alberto           | Del Sole                        |
        | Adriano Dello Spavento                    | Adriano           | Dello Spavento                  |
        | Luca Delle Fave                           | Luca              | Delle Fave                      |
        | Francesca Della Valle                     | Francesca         | Della Valle                     |
        | Guido Delle Colonne                       | Guido             | Delle Colonne                   |
        | Tomasso D'Arco                            | Tomasso           | D'Arco                          |

    Scenario Outline: German
      Given Incognito instance object
      When I assign <full_name> to incognito
      Then he should have a <first_name> and a <last_name>

      Examples:
        | full_name                                 | first_name        | last_name                       |
        | Ludwig Mies van der Rohe                  | Ludwig            | Mies van der Rohe               |
        | Johann Wolfgang von Goethe                | Johann Wolfgang   | von Goethe                      |

    Scenario Outline: Dutch
      Given Incognito instance object
      When I assign <full_name> to incognito
      Then he should have a <first_name> and a <last_name>

      Examples:
        | full_name                                 | first_name        | last_name                       |
        | Gabriel Van Helsing                       | Gabriel           | Van Helsing                     |
        | Johan de heer Van Kampen                  | Johan             | de heer Van Kampen              |
        | Han Van De Casteele                       | Han               | Van De Casteele                 |
        | Han Vande Casteele                        | Han               | Vande Casteele                  |

    Scenario Outline: Spanish
      Given Incognito instance object
      When I assign <full_name> to incognito
      Then he should have a <first_name> and a <last_name>

      Examples:
        | full_name                                 | first_name        | last_name                       |
        | Juan Martín de la Cruz Gómez              | Juan Martín       | de la Cruz Gómez                |
        | Javier Reyes de la Barrera                | Javier            | Reyes de la Barrera             |
        | Rosa María Pérez Martínez Vda. de la Cruz | Rosa María        | Pérez Martínez Vda. de la Cruz  |

    Scenario Outline: Asian
      Given Incognito instance object
      When I assign <full_name> to incognito
      Then he should have a <first_name> and a <last_name>

      Examples:
        | full_name                                 | first_name        | last_name                       |
        | Jaazaniah ben Shaphan                     | Jaazaniah         | ben Shaphan                     |
        | Noda' bi-Yehudah                          | Noda'             | bi-Yehudah                      |