# OpenPredict
OpenPredict is an open-source unit prediction library utilizing a simple, yet effective API.

#####Core Functions:
  ```lua
  GetPrediction(unit, spellData)
  GetLinearAOEPrediction(unit, spellData)
  GetCircularAOEPrediction(unit, spellData)
  GetConicAOEPrediction(unit, spellData)
  
  The parameter "unit" refers to an in-game unit such as a hero or champion and NOT an object (i.e. with stats).
  ```

All core functions used in OpenPredict return a predictInfo object:

```lua
  members:
    predictInfo.x                 -- Self-explanatory.
    predictInfo.y                 -- Self-explanatory.
    predictInfo.z                 -- Self-explanatory.
    
    predictInfo.mCastPos          -- Best cast position.
    predictInfo.mPredictPos       -- Predicted position.
    predictInfo.mHitChance        -- Probability of skillshot hitting target (0.0f - 1.0f)
    predictInfo.mCollision        -- True if collision detected.
```

```lua
local sD = { delay = 0.25, speed = 2000, width = 50, range = 1000, collision = true, source = myHero }
local pI = GetPrediction(unit, sD)
```
