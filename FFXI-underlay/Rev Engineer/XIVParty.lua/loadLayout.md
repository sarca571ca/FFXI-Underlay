```
function loadLayout(layoutName)
    if layoutName == layoutAuto then
        local resY = windower.get_windower_settings().ui_y_res
        if resY <= 1200 then
            layoutName = layout1080
        else
            layoutName = layout1440
        end
    end
    layout = config.load('layouts/' .. layoutName .. '.xml', layoutDefaults)
end
```
