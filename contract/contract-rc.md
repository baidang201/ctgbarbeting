# Smart Contract - `{{ contract }}`

This is an overview of the actions for the `{{ contract }}` smart contract. This Contract is legally binding and can be used in the event of a dispute. Disputes shall be settled through the standard arbitration process established by EOS.IO.

### Description

The `{{ contract }}` contract is a Simple betting Football(Soccer) game.

### Actions, Inputs and Input Types

The table below contains the `actions`, `inputs` and `input types` for the `{{ contract }}` contract.

| Action | Input | Input Type |
|:--|:--|:--|
| `{{ relgameram }}` | `{{ idgame }}` | `{{ uint64 }}` |
| `{{ finalize }}` | `{{ idgame }}`<br/>`{{ score1 }}`<br/>`{{ score2 }}` | `{{ uint64 }}`<br/>`{{ uint32 }}`<br/>`{{ uint32 }}` |
| `{{ newbet }}` | `{{ from }}`<br/>`{{ idgame }}`<br/>`{{ score1 }}`<br/>`{{ score2 }}`<br/>`{{ value }}` | `{{ name }}`<br/>`{{ uint64 }}`<br/>`{{ uint32 }}`<br/>`{{ uint32 }}`<br/>`{{ asset }}` |
| `{{ claim }}` | `{{ name }}` | `{{ name }}` |
| `{{ newgame }}` | `{{ description }}`<br/>`{{ team1 }}`<br/>`{{ team2 }}`<br/>`{{ fee }}`<br/>`{{ value_min }}`<br/>`{{ value_max }}`<br/>`{{ bet_until_year }}`<br/>`{{ bet_until_month }}`<br/>`{{ bet_until_day }}`<br/>`{{ bet_until_hour }}`<br/>`{{ bet_until_minute }}`<br/>`{{ tags }}`<br/>`{{ location }}` | `{{ string }}`<br/>`{{ string }}`<br/>`{{ string }}`<br/>`{{ uint8 }}`<br/>`{{ asset }}`<br/>`{{ asset }}`<br/>`{{ uint16 }}`<br/>`{{ uint8 }}`<br/>`{{ uint8 }}`<br/>`{{ uint8 }}`<br/>`{{ uint8 }}`<br/>`{{ string }}`<br/>`{{ string }}` |
| `{{ updategamest }}` | `{{ id }}` | `{{ uint64 }}` |
| `{{ transfer }}` | `{{ from }}`<br/>`{{ to }}`<br/>`{{ quantity }}`<br/>`{{ memo }}` | `{{ name }}`<br/>`{{ name }}`<br/>`{{ asset }}`<br/>`{{ string }}` |