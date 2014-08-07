<!-- # Models
users
  - team name
  - roster
  -
leagues
  -
players

# User Types

League Owner: The person creating a league including the people included
League Participant: People who are participating in the league draft


Only numbers available in the draft roster may be entered during
each player's turn during draft.

Once player has been selected in draft, he is no longer available for
the duration of draft.

Each league member must select one QB, RB and WR in draft. Cannot have
multiple of one position.


## Usage:

ffd --create [LEAGUE_NAME]

`Enter team name of commissioner` - Commissioner enters team name

`Add another member to league 'add' or 'done'` - Mark 'done' when ready to start draft

`Enter members's team name` - Enter next member's team name. Back to previous step.

*Draft Begins*

`It is 'team_name's turn` - Member types in number from player list to add to roster

This step is repeated until draft is complete.

Team rosters will be displayed at the end of the draft

Program ends


# Stories

## League owner creates a league

As a league owner
In order for me to create a league
I want to enter a league name and my name as the league owner

## Acceptance Criteria:
A valid league consists of a name and at least one player.


## League Participant

As a league participant
In order for me to draft players
I would want to join a league

As a league participant
In order for me to draft players
I would need the draft to be started

As a league participant
In order for me to draft players
I would need to be notified that it is my turn

As a league participant
In order for me to draft the best players
I would need to see the players rank

As a league participant
In order for me to draft players that are still available
I would need to know which players are left for me to select

As a league participant
In order for me to best compete against the other players
I would need to know the roster of each team/league participant
