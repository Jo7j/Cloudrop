# OpenPredict
OpenPredict is an open-source unit prediction library.

#####Core Functions:
  ```lua
  GetPrediction(unit, { delay, speed, width, range, collision, source })
  GetLinearAOEPrediction(unit, { delay, speed, width, range, collision, source })
  GetCircularAOEPrediction(unit, { delay, speed, width, range, collision, source })
  GetConicAOEPrediction(unit, { delay, speed, width, range, collision, source })
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
