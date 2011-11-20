@comments
Feature: Posting a comment should result in a friendly redirect

# TOP LEVEL COMMENTS

Scenario: Posting a top level comment on a one-chapter work
  Given I have a work "Blabla"
    And I am logged in as a random user
  When I view the work "Blabla"
    And I post a comment "blaaaaaa"
  Then I should see "Blabla"
    And I should see "blaaaaaa"

Scenario: Posting top level comment on middle chapter of chaptered work, with default preferences
  Given the chaptered work setup
    And I am logged in as a random user
  When I view the work "BigBang"
    And I view the 2nd chapter
    And I post a comment "Woohoo"
  Then I should see "Woohoo"
    And I should see "Chapter 2" within ".title"
    And I should not see "Chapter 1" within ".title"

Scenario: Posting top level comment on a chaptered work, while in temporary view full mode, with default preferences
  Given the chaptered work setup
    And I am logged in as a random user
  When I view the work "BigBang" in full mode
    And I post a comment "Woohoo"
  Then I should see "Woohoo"
    And I should see "Chapter 2" within ".title"
    And I should see "Chapter 3" within ".title"

Scenario: Posting top level comment on a chaptered work, with view full work in the preferences
  Given the chaptered work setup
    And I am logged in as a random user
    And I set my preferences to View Full Work mode by default
  When I view the work "BigBang"
    And I post a comment "Woohoo"
  Then I should see "Woohoo"
    And I should see "Chapter 2" within ".title"
    And I should see "Chapter 3" within ".title"

 Scenario: Posting top level comment on a middle chapter, while in temporary view by chapter mode, with view full work in the preferences
  Given the chaptered work setup
    And I am logged in as a random user
    And I set my preferences to View Full Work mode by default
  When I view the work "BigBang" in chapter-by-chapter mode
    And I view the 2nd chapter
    And I post a comment "Woohoo"
  Then I should see "Woohoo"
    And I should see "Chapter 2" within ".title"
  # TODO: determine desired behaviour, then add param for c-by-c mode if the below is really wanted
    # And I should not see "Chapter 1" within ".title"

# REPLY COMMENTS

Scenario: Posting a reply comment to a comment on a one-chapter work
  Given the work with comments setup
    And I am logged in as a random user
    And I view the work "Blabla"
    And I follow "Comments"
  When I reply to a comment with "Supercalifragelistic"
  Then I should see "Supercalifragelistic"

Scenario: Posting a reply comment to a comment on the first chapter, with default preferences
  Given the chaptered work with comments setup
    And I am logged in as a random user
    And I view the work "BigBang"
    And I view the 1st chapter
    And I follow "Comments"
  When I reply to a comment with "Supercalifragelistic"
  Then I should see "Supercalifragelistic"

Scenario: Posting a reply comment to a comment on a middle chapter, with default preferences
  Given the chaptered work with comments setup
    And I am logged in as a random user
    And I view the work "BigBang"
    And I view the 2nd chapter
    And I follow "Comments"
  When I reply to a comment with "Supercalifragelistic"
  Then I should see "Supercalifragelistic"
    And I should see "Chapter 2" within ".title"
    And I should not see "Chapter 1" within ".title"

Scenario: Posting reply comment on a chaptered work, while in temporary view full mode, with default preferences
  Given the chaptered work with comments setup
    And I am logged in as a random user
    And I view the work "BigBang" in full mode
    And I follow "Comments"
  Then I should see "Chapter 2" within ".title"
  When I reply to a comment with "Supercalifragelistic"
  Then I should see "Supercalifragelistic"
    And I should see "Chapter 2" within ".title"
    And I should see "Chapter 3" within ".title"

Scenario: Posting reply comment on a chaptered work, with view full work in the preferences
  Given the chaptered work with comments setup
    And I am logged in as a random user
    And I set my preferences to View Full Work mode by default
    And I view the work "BigBang"
    And I follow "Comments"
  When I reply to a comment with "Supercalifragelistic"
  Then I should see "Supercalifragelistic"
    And I should see "Chapter 2" within ".title"
    And I should see "Chapter 3" within ".title"

@wip
Scenario: Posting top level comment on a middle chapter, while in temporary view by chapter mode, with view full work in the preferences
  Given the chaptered work with comments setup
    And I am logged in as a random user
    And I set my preferences to View Full Work mode by default
    And I view the work "BigBang" in chapter-by-chapter mode
    And I view the 2nd chapter
  # TODO: determine if this opens comments on that chapter only, or if it redirects to full work
    And I follow "Comments"
  When I reply to a comment with "Supercalifragelistic"
  Then I should see "Supercalifragelistic"
    And I should see "Chapter 2" within ".title"
  # TODO: determine desired behaviour, then add param for c-by-c mode if the below is really wanted
    # And I should not see "Chapter 1" within ".title"
