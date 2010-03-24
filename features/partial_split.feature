Feature: Split partial name
  In order to split full name into first name and last name
  As a full name holder
  I want to get first name and last name
  
  Scenario Outline: Partial Names
    Given Incognito instance object
    When I assign <full_name> to incognito
    Then he should have partial <first_name> or partial <last_name>

    Examples:
      | full_name     | first_name      | last_name       |
      | Van Helsing   | nil             | "Van Helsing"   |
      | d'Artagnan    | nil             | "d'Artagnan"    |
      | O'Connor      | nil             | "O'Connor"      |
      | George        | "George"        | nil             |
      | Kevin J.      | "Kevin J."      | nil             |
      | George H. W.  | "George H. W."  | nil             |
