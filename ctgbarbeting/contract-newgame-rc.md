# Action - `{{ newgame }}`

This Contract is legally binding and can be used in the event of a dispute. Disputes shall be settled through the standard arbitration process established by EOS.IO.

### Description

The `{{ newgame }}` action can create a new game for bets. The initial status of new game is open.

### Inputs and Input Types

The `{{ newgame }}` action requires the following `inputs` and `input types`:

| Action | Input | Input Type |
|:--|:--|:--|
| `{{ newgame }}` | `{{ descriptionVar }}`<br/>`{{ team1Var }}`<br/>`{{ team2Var }}`<br/>`{{ feeVar }}`<br/>`{{ value_minVar }}`<br/>`{{ value_maxVar }}`<br/>`{{ bet_until_yearVar }}`<br/>`{{ bet_until_monthVar }}`<br/>`{{ bet_until_dayVar }}`<br/>`{{ bet_until_hourVar }}`<br/>`{{ bet_until_minuteVar }}`<br/>`{{ tagsVar }}`<br/>`{{ locationVar }}` | `{{ string }}`<br/>`{{ string }}`<br/>`{{ string }}`<br/>`{{ uint8 }}`<br/>`{{ asset }}`<br/>`{{ asset }}`<br/>`{{ uint16 }}`<br/>`{{ uint8 }}`<br/>`{{ uint8 }}`<br/>`{{ uint8 }}`<br/>`{{ uint8 }}`<br/>`{{ string }}`<br/>`{{ string }}` |
