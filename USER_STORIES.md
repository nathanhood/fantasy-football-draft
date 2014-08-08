
# User Types

League Commissioner: The person creating a league
League Participant: People who are participating in the league draft


# Stories

## League commissioner creates a league
As a league commissioner
I want to enter a league name and my name as the league owner
In order for me to create a league

### Usage:
ffd --create [LEAGUE_NAME]

`Enter commissioner's team name` - Commissioner enters team name

### Acceptance Criteria:
A valid league consists of a name with numbers and/or letters and at least one player.



## League participant joins a league
As a league participant
I would want to join a league
In order for me to draft players

### Usage:
`Add another member to league 'add' or 'done'` - Mark 'done' when ready to start draft

`Enter members's team name` - Enter next member's team name. Back to previous step.

### Acceptance Criteria:
A valid league consists of a name with numbers and/or letters and at least one player.


## Draft Started


## League participants take turns
As a league participant
I want to be notified that it is my turn
In order for me to draft a player

### Usage
`It is {team_name}'s turn` - Member types in number from player list to add to roster

### Acceptance Criteria
Only numbers available in the draft roster may be entered during
each player's turn during draft.


## League participant makes decision based on player rank
As a league participant
I want to see the players rank
In order for me to draft the best players


## Draft Roster diminishes with each draft pick
As a league participant
I would need to know which players are left for me to select
In order for me to draft players that are still available

### Acceptance Criteria
Once player has been selected in draft, he is no longer available for
the duration of draft.


## League participant views roster
As a league participant
I would need to know the roster of each team/league participant
In order for me to best compete against the other players

### Acceptance Criteria
Each league member must select one QB, RB and WR in draft. Cannot have
multiple of one position.

### Usage
This step is repeated until draft is complete.

Team rosters will be displayed at the end of the draft

Program ends
