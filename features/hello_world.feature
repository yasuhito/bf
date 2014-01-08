Feature: Hello World

  Scenario: Hello World #1
    When I run `bf` interactively
    And I type:
      """
      ++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.
      """
    And I close the stdin stream
    Then the output should contain:
      """
      Hello World!
      """

  Scenario: Hello World #2
    When I run `bf` interactively
    And I type:
      """
      >++++++++[<+++++++++>-]<.>>+>+>++>[-]+<[>[->+<<++++>]<<]>.+++++++..+++.>
      >+++++++.<<<[[-]<[-]>]<+++++++++++++++.>>.+++.------.--------.>>+.>++++.
      """
    And I close the stdin stream
    Then the output should contain:
      """
      Hello World!
      """

